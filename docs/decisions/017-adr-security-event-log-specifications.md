# 017-ADR: Security Event Log Specifications

Architectural Decision Records (ADR) on standardizing the creation, collection, normalization, and exchange of security event logs.

A representative authentication failure illustrates the selected layered mapping. Field names and versions are illustrative; production mappings pin their supported schema versions and replace the RFC 5424 example enterprise ID with a registered private enterprise number.

```yaml
opentelemetry:
  EventName: example.security.authentication
  Timestamp: "1786996800000000000"
  ObservedTimestamp: "1786996800250000000"
  SeverityNumber: 13
  SeverityText: WARN
  TraceId: 4bf92f3577b34da6a3ce929d0e0e4736
  SpanId: 00f067aa0ba902b7
  Resource:
    service.name: identity-api
    service.version: 2.4.0
    host.name: auth.example
  Attributes:
    example.user.id: user-123
    client.address: 192.0.2.10
    example.security.authentication.outcome: failure
    error.type: invalid_credentials
  Body: Authentication failed

ocsf:
  metadata:
    version: 1.9.0
    product:
      name: identity-api
      vendor_name: Example
      version: 2.4.0
  category_uid: 3
  class_uid: 3002
  activity_id: 1
  type_uid: 300201
  time: 1786996800000
  severity_id: 3
  status_id: 2
  user:
    uid: user-123
  service:
    name: identity-api
  src_endpoint:
    ip: 192.0.2.10
  message: Authentication failed

rfc5424: '<132>1 2026-08-17T20:00:00.000Z auth.example identity-api 4321 AUTHN [exampleSDID@32473 class_uid="3002" activity_id="1" type_uid="300201" trace_id="4bf92f3577b34da6a3ce929d0e0e4736"] Authentication failed'
```

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. OpenTelemetry Logs and Events](#31-opentelemetry-logs-and-events)
  - [3.2. Open Cybersecurity Schema Framework](#32-open-cybersecurity-schema-framework)
  - [3.3. RFC 5424 Syslog](#33-rfc-5424-syslog)
  - [3.4. Versioned Mapping and Security Controls](#34-versioned-mapping-and-security-controls)
- [4. Considered](#4-considered)
  - [4.1. RFC 5424 as the Sole Specification](#41-rfc-5424-as-the-sole-specification)
  - [4.2. OCSF as the Sole Specification](#42-ocsf-as-the-sole-specification)
  - [4.3. OpenTelemetry as the Sole Specification](#43-opentelemetry-as-the-sole-specification)
  - [4.4. Layered OpenTelemetry, OCSF, and RFC 5424](#44-layered-opentelemetry-ocsf-and-rfc-5424)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-08-17
- Status: Proposed

## 2. Context

Security-relevant activity is produced by first-party applications, operating systems, network devices, identity providers, cloud services, and security controls. These sources use different event names, field structures, severity scales, clocks, and transport protocols. A message that is sufficient for local troubleshooting is not necessarily suitable for detection, investigation, cross-product correlation, or audit evidence.

No single specification considered here covers the complete lifecycle:

- [OpenTelemetry](https://opentelemetry.io/docs/specs/otel/logs/) defines APIs, an SDK, a logical Logs Data Model, event semantics, trace correlation, collection, processing, and export for telemetry.
- [OCSF](https://github.com/ocsf/ocsf-schema) defines a vendor-neutral taxonomy and normalized schema for cybersecurity events, but is agnostic to collection, transport, and storage.
- [RFC 5424](https://www.rfc-editor.org/rfc/rfc5424) defines an interoperable syslog message format and a transport-independent architecture, but does not define a storage format or a comprehensive security-event taxonomy.

The architecture therefore needs an explicit division of responsibility and a governed mapping between specifications. Without that contract, producers may emit free-form messages, transformations may silently discard evidence, severity values may be compared incorrectly, and downstream systems may be unable to distinguish an event-time value from an ingestion-time value.

1. Decision Drivers

    - Security Semantics
      > Represent authentication, authorization, configuration, data-access, detection, finding, and remediation activity with stable machine-readable meaning.

    - Correlation
      > Correlate security activity with services, hosts, users, processes, and distributed traces without parsing display messages.

    - Interoperability
      > Accept and produce standards-based syslog where established infrastructure or external integrations require it.

    - Fidelity and Provenance
      > Preserve source values, event time, observation time, transformation history, and schema versions so that normalization remains explainable.

    - Confidentiality and Data Minimization
      > Prevent credentials, tokens, cryptographic material, and unnecessary personal data from entering telemetry pipelines.

    - Integrity and Availability
      > Detect malformed or dropped records, protect events in transit and at rest, and avoid delivery modes that silently weaken security evidence.

    - Evolvability
      > Permit independent, controlled upgrades of OpenTelemetry semantic conventions, OCSF schemas, and boundary mappings.

    - Vendor Neutrality
      > Keep the source contract and normalized security model portable across collectors, security analytics platforms, and storage backends.

## 3. Decision

Adopt a layered security-event logging architecture. OpenTelemetry is the canonical representation for first-party emission and collection, OCSF is the canonical normalized representation for security analytics, and RFC 5424 is an interoperability format at syslog boundaries. These specifications complement one another and MUST NOT be treated as interchangeable schemas.

Only events classified as security relevant require OCSF normalization. Ordinary diagnostic logs may remain OpenTelemetry LogRecords when they do not support a security detection, investigation, response, or audit use case.

### 3.1. OpenTelemetry Logs and Events

Use the [OpenTelemetry Logs Data Model](https://opentelemetry.io/docs/specs/otel/logs/data-model/) for first-party security-event emission and for the internal collection envelope. A security event is represented as an OpenTelemetry LogRecord with a non-empty `EventName`; unstructured diagnostic text remains a LogRecord without an event name.

1. Event Contract

    - Set `EventName` to a stable, low-cardinality, domain-specific name that uniquely identifies the record structure. Dynamic values such as user IDs, resource IDs, and outcomes belong in attributes.

    - Set `Timestamp` to the time the activity occurred. Collection components set `ObservedTimestamp` when they first observe the record; they MUST NOT overwrite the source event time.

    - Set `SeverityNumber` according to OpenTelemetry semantics and preserve the source label in `SeverityText`. Severity is independent of outcome: a successful privileged action may still be security significant.

    - Put source identity in `Resource`, emitter identity in `InstrumentationScope`, occurrence-specific structured data in `Attributes`, and an optional concise display message in `Body`.

    - Populate `TraceId`, `SpanId`, and `TraceFlags` when valid trace context exists. A security event MUST NOT depend on a sampled span event for durable recording; it is emitted as a LogRecord even when it is also associated with a span.

    - Use documented OpenTelemetry semantic-convention attributes where they fit. Custom attributes MUST use a project-owned namespace and have documented types, cardinality, sensitivity, and lifecycle.

2. Collection

    - Send LogRecords through an OpenTelemetry SDK or compatible log appender to an OpenTelemetry Collector using OTLP where supported.

    - Receive legacy and third-party formats at collector or gateway boundaries, parse them without changing source semantics, and populate the OpenTelemetry envelope before normalization.

    - Apply enrichment, redaction, routing, and batching in observable pipeline stages. Each stage MUST expose rejected-record, dropped-record, retry, queue-capacity, and export-failure metrics.

OpenTelemetry event semantic conventions currently have `Development` status. Each implementation MUST pin the semantic-convention and SDK versions it supports, record the applicable Schema URL where the SDK supports it, and validate upgrades before deployment.

### 3.2. Open Cybersecurity Schema Framework

Normalize security-relevant OpenTelemetry Events to the [Open Cybersecurity Schema Framework (OCSF)](https://schema.ocsf.io/) at a collector, stream processor, or security-ingestion boundary. Producers SHOULD emit source-domain facts rather than construct OCSF records directly unless they are purpose-built security products with a validated native OCSF implementation.

1. Normalized Event Contract

    - Select the most specific applicable OCSF event class and activity. Populate required classification fields including `category_uid`, `class_uid`, `activity_id`, and `type_uid`; compute `type_uid` according to the selected OCSF schema.

    - Populate the OCSF event `time` from the OpenTelemetry `Timestamp` using an explicit, tested precision conversion. Preserve observation and processing times in semantically equivalent OCSF metadata fields; do not substitute them for a known event time.

    - Populate `metadata.product` with the source product identity and `metadata.version` with the exact OCSF schema version used for normalization.

    - Map actors, users, processes, services, devices, source endpoints, destination endpoints, status, and observables to their typed OCSF fields. Do not flatten typed objects into a free-form message.

    - Map severity by documented meaning, not by copying an integer. OpenTelemetry, OCSF, and syslog use different numeric domains and severity semantics.

    - Preserve a concise human-readable summary in `message` when useful. Retain source records in `raw_data` only when forensic value, access controls, retention policy, and data classification justify the additional exposure.

    - Use `unmapped` only as a temporary, monitored compatibility mechanism. Repeated or detection-critical source fields require a governed mapping or an OCSF extension.

2. Validation

    - Validate every normalized event against the pinned OCSF schema and applicable profiles before it enters the security analytics store.

    - Route invalid events to a restricted dead-letter path with validation diagnostics. The pipeline MUST raise an operational alert and MUST NOT silently discard or coerce invalid fields.

    - Test mappings with valid, missing, malformed, boundary, and forward-version fixtures. Round-trip preservation is required for fields designated as evidentiary in the mapping contract.

### 3.3. RFC 5424 Syslog

Use [RFC 5424](https://www.rfc-editor.org/rfc/rfc5424) only at boundaries that require syslog interoperability, including operating-system and network-device ingress and integrations with established syslog collectors. RFC 5424 is not the canonical internal security schema and is not a storage specification.

1. Ingress

    - Parse `PRI`, `VERSION`, `TIMESTAMP`, `HOSTNAME`, `APP-NAME`, `PROCID`, `MSGID`, `STRUCTURED-DATA`, and `MSG` as distinct fields.

    - Map the source `TIMESTAMP` to OpenTelemetry `Timestamp` and the receiver time to `ObservedTimestamp`. Preserve timestamp quality information when the `timeQuality` structured-data element is present.

    - Preserve original facility and severity codes as attributes and map severity to OpenTelemetry by meaning. Preserve unrecognized structured-data elements under a namespaced attribute structure.

    - Map `HOSTNAME` and `APP-NAME` to resource identity only after applying trusted-source and relay rules. An asserted header value alone is not proof of origin.

    - Preserve the original message under the restricted raw-event policy when required for forensics; use the parsed `MSG` as the OpenTelemetry `Body` rather than as the source of normalized fields when structured fields are available.

2. Egress

    - Define a versioned RFC 5424 export profile for every consuming integration. The profile specifies header derivation, facility and severity mapping, structured-data IDs, maximum message size, truncation behavior, and treatment of fields that have no lossless representation.

    - Put machine-readable fields in `STRUCTURED-DATA` and reserve `MSG` for a concise human-readable summary. Private extensions MUST use an SD-ID associated with a registered private enterprise number.

    - Place the highest-priority routing and correlation fields early enough to survive receiver size limits. Exporters MUST measure oversize, truncated, rejected, and dropped messages.

3. Transport

    - Use TLS transport as specified by [RFC 5425](https://www.rfc-editor.org/rfc/rfc5425) for network delivery unless a documented threat model approves another protected transport.

    - Do not use UDP for security events when loss, reordering, or source spoofing would impair detection or audit evidence.

    - Because RFC 5424 itself provides no delivery acknowledgement, gateways MUST use durable queues, bounded retry, backpressure, and delivery monitoring appropriate to the required assurance level.

### 3.4. Versioned Mapping and Security Controls

Maintain mappings as versioned, testable artifacts rather than undocumented collector expressions. A mapping is identified by source schema and version, OpenTelemetry semantic-convention version, OCSF schema version, and destination profile version.

1. Minimum Mapping Contract

    | Concern | Source/OpenTelemetry | OCSF | RFC 5424 boundary |
    | --- | --- | --- | --- |
    | Event identity | `EventName` and source event code | `class_uid`, `activity_id`, `type_uid` | `MSGID` and profile-defined structured data |
    | Event time | `Timestamp` | `time` | `TIMESTAMP` |
    | Observation time | `ObservedTimestamp` | Applicable processing metadata | Receiver timestamp; never overwrite source time |
    | Source identity | `Resource` | Typed product, device, service, and endpoint objects | `HOSTNAME`, `APP-NAME`, and `origin` structured data |
    | Correlation | `TraceId`, `SpanId`, and stable event identifiers | Governed correlation mapping or extension | Profile-defined structured data |
    | Severity | `SeverityNumber` and `SeverityText` | `severity_id` and `severity` | `PRI` severity plus preserved facility |
    | Details | Typed `Attributes` | Typed class and profile attributes | `STRUCTURED-DATA` |
    | Display text | `Body` | `message` | `MSG` |
    | Schema provenance | Schema URL and instrumentation version | `metadata.version` and mapping version | `VERSION` plus export-profile identifier |

2. Security Controls

    - Data Minimization
      > Never record passwords, session secrets, API keys, private keys, raw authorization headers, or complete authentication tokens. Redact at the earliest controlled stage and test redaction with adversarial fixtures.

    - Access and Encryption
      > Encrypt security events in transit and at rest, separate producer, pipeline, analyst, and administrator permissions, and audit access to restricted raw records.

    - Integrity and Provenance
      > Record source identity, collector identity, mapping version, and processing timestamps. Use append-only or tamper-evident storage where the threat model or compliance requirements demand evidentiary integrity; transport protection alone is insufficient.

    - Availability
      > Do not sample security events by default. Any aggregation, rate limit, or sampling policy requires explicit approval, a documented loss budget, and metrics that expose the discarded volume.

    - Resource Safety
      > Bound attribute counts, value sizes, nesting, queue usage, and exporter retries. High-cardinality values belong in attributes, never in event names or metric labels.

    - Clock Quality
      > Synchronize source and collector clocks, retain both event and observation times, preserve supplied offsets or time-quality metadata, and alert on material clock skew.

    - Failure Handling
      > Define whether each producer buffers, blocks, or degrades when the pipeline is unavailable. Security-control decisions MUST NOT depend on a telemetry export succeeding unless that dependency is explicitly designed and tested.

## 4. Considered

### 4.1. RFC 5424 as the Sole Specification

[RFC 5424](https://www.rfc-editor.org/rfc/rfc5424) standardizes a widely supported syslog message format with an extensible structured-data field and transport mappings.

- Pros

  - Interoperability
    > Integrates with operating systems, appliances, and existing syslog infrastructure.

  - Simplicity
    > Provides a compact envelope with familiar facility, severity, source, and message fields.

- Cons

  - Security Semantics
    > Does not provide a comprehensive cross-vendor cybersecurity taxonomy or typed domain objects.

  - Correlation
    > Has no standard trace-correlation model equivalent to OpenTelemetry's trace and resource fields.

  - Reliability and Storage
    > Defines neither delivery acknowledgement nor a storage format; transport and persistence guarantees require additional specifications and controls.

  - Fidelity
    > Receiver size limits permit truncation or discard, and vendor-specific structured data does not by itself create semantic interoperability.

### 4.2. OCSF as the Sole Specification

[OCSF](https://github.com/ocsf/ocsf-schema) provides a vendor-neutral taxonomy, event classes, reusable objects, profiles, and normalized attributes for cybersecurity data.

- Pros

  - Security Semantics
    > Enables consistent detection and investigation across heterogeneous products and event sources.

  - Vendor Neutrality
    > Separates normalized security meaning from a specific analytics or storage vendor.

  - Extensibility
    > Supports profiles and extensions while retaining a common core schema.

- Cons

  - Collection
    > Is intentionally agnostic to instrumentation, collection, transport, and storage.

  - Producer Complexity
    > Requiring every application to construct OCSF records would duplicate mapping logic and couple business code to a security analytics schema.

  - General Observability
    > Does not replace OpenTelemetry's cross-signal resource and trace-correlation model for application telemetry.

### 4.3. OpenTelemetry as the Sole Specification

[OpenTelemetry Logs](https://opentelemetry.io/docs/specs/otel/logs/) provides a common telemetry data model, APIs, SDKs, collection pipelines, trace correlation, and export mechanisms.

- Pros

  - Correlation
    > Relates logs and events to resources, traces, spans, and instrumentation scopes.

  - Collection
    > Supports first-party instrumentation, existing logging libraries, legacy log ingestion, processing, and OTLP export.

  - Portability
    > Decouples producers from a specific telemetry backend.

- Cons

  - Security Semantics
    > Its general-purpose attributes and events do not provide OCSF's comprehensive security taxonomy, event classes, and typed security objects.

  - Maturity
    > Event semantic conventions are still evolving and require pinned versions and upgrade governance.

  - Interoperability
    > Does not eliminate the need to support syslog-speaking devices and external systems.

### 4.4. Layered OpenTelemetry, OCSF, and RFC 5424

Use each specification for the layer it defines best: OpenTelemetry for emission and collection, OCSF for security normalization, and RFC 5424 for syslog interoperability.

- Pros

  - Complete Lifecycle
    > Covers instrumentation, correlation, collection, normalization, and established system boundaries without forcing one specification outside its intended scope.

  - Fidelity
    > A governed mapping preserves source values and exposes transformations rather than relying on free-form messages.

  - Evolvability
    > Versioned adapters allow each specification to advance independently.

- Cons

  - Complexity
    > Requires mapping artifacts, validators, schema registries, compatibility tests, and operational monitoring.

  - Storage and Processing Cost
    > Preserving both source and normalized representations can increase pipeline and retention costs.

  - Semantic Conflict
    > Timestamp, severity, identity, and extension fields require deliberate mappings because similarly named fields do not always have identical meaning.

## 5. Consequences

- Positive

  - Security events have stable names, typed fields, explicit schema versions, and trace and resource correlation at collection time.

  - Security analytics receives normalized OCSF records across first-party, third-party, system, and device sources.

  - Existing syslog integrations remain supported without making syslog the internal application schema.

  - Mapping tests, dead-letter handling, and loss metrics make transformation failures visible and auditable.

  - Versioned boundaries reduce vendor lock-in and permit staged specification upgrades.

- Negative

  - Teams must operate and maintain collectors, normalization rules, schema validators, queues, and restricted failure paths.

  - Some fields cannot be mapped losslessly; preserving source values and documenting extensions increases record size and governance work.

  - Dual retention of source and normalized records may increase storage, privacy, and access-control obligations.

  - OCSF and OpenTelemetry schema evolution can require coordinated mapping migrations and replay tests.

- Risks

  - Sensitive Data Leakage
    > Structured attributes can expose secrets or personal data at scale. Mitigate with source-side allowlists, redaction, classification, restricted raw storage, and automated tests.

  - Silent Event Loss
    > Queue overflow, sampling, malformed input, receiver truncation, or exporter failure can create false confidence. Mitigate with durable buffering, loss metrics, alerts, dead-letter handling, and reconciliation tests.

  - Incorrect Normalization
    > A plausible but incorrect class, actor, outcome, timestamp, or severity can mislead detections. Mitigate with reviewed mapping specifications, representative fixtures, schema validation, and provenance fields.

  - Schema Drift
    > Unpinned dependencies or implicit collector changes can alter event meaning. Mitigate with version locks, compatibility gates, canary deployments, and replayable fixtures.

  - Source Spoofing
    > Syslog header fields and application-supplied resource attributes may be forged. Mitigate with authenticated transport, trusted receiver metadata, workload identity, and explicit conflict-resolution rules.

## 6. Implementation

1. Inventory Security Events

    Catalogue events needed for detection, investigation, incident response, and audit. Record the source, threat or control objective, required fields, sensitivity, expected volume, retention class, and loss tolerance.

2. Define the OpenTelemetry Event Catalogue

    For each first-party event, define a stable `EventName`, occurrence conditions, timestamp source, default severity, required and optional attributes, resource requirements, trace-correlation behavior, sensitivity, and examples. Generate or test language-specific emitters against this catalogue.

3. Establish a Versioned Mapping Registry

    Store source-to-OpenTelemetry, OpenTelemetry-to-OCSF, and boundary export mappings as reviewed artifacts. Pin OpenTelemetry semantic-convention, OCSF schema, collector component, and export-profile versions.

4. Build the Collection Pipeline

    Configure OpenTelemetry SDKs or appenders for first-party services and deploy collectors or gateways for OTLP and RFC 5424 inputs. Apply trusted-source enrichment, redaction, size limits, durable buffering, and routing before normalization.

5. Normalize and Validate OCSF

    Select OCSF classes and profiles per event catalogue entry, transform records, attach schema and mapping provenance, validate against the pinned schema, and route failures to the restricted dead-letter path.

6. Implement Syslog Profiles

    Create per-integration RFC 5424 ingress and egress profiles. Use RFC 5425 TLS transport, test framing and message-size limits with the actual peer, and monitor truncation, rejection, retry, and loss.

7. Apply Storage and Access Controls

    Define normalized and raw retention separately. Encrypt both, restrict raw-event access, audit privileged queries, and enable append-only or tamper-evident controls where required by the threat model or compliance obligations.

8. Add Conformance Gates

    CI validates event definitions, naming and cardinality constraints, prohibited-data rules, schema conformance, mapping fixtures, severity conversions, timestamp precision, and backward compatibility. Release gates fail on undocumented mapping or schema-version changes.

9. Exercise Failure Modes

    Test malformed input, unavailable collectors, queue exhaustion, duplicate delivery, clock skew, oversized syslog messages, schema upgrades, and replay. Verify alerts and recovery without losing the provenance needed to explain each record.

10. Review Periodically

    Review the event catalogue, mapping coverage, dead-letter volume, sensitive-data findings, specification versions, and detection usefulness at least once per release cycle that changes security telemetry.

## 7. References

- Issue [#526: Create an ADR on Security Event Log Specifications](https://github.com/sentenz/convention/issues/526) issue.
- IETF [RFC 5424: The Syslog Protocol](https://www.rfc-editor.org/rfc/rfc5424) standard.
- IETF [RFC 5425: Transport Layer Security (TLS) Transport Mapping for Syslog](https://www.rfc-editor.org/rfc/rfc5425) standard.
- OCSF [schema repository](https://github.com/ocsf/ocsf-schema) repository.
- OCSF [schema browser](https://schema.ocsf.io/) documentation.
- OCSF [Understanding the Open Cybersecurity Schema Framework](https://github.com/ocsf/ocsf-docs/blob/main/overview/understanding-ocsf.md) documentation.
- OpenTelemetry [Logging](https://opentelemetry.io/docs/specs/otel/logs/) specification.
- OpenTelemetry [Logs Data Model](https://opentelemetry.io/docs/specs/otel/logs/data-model/) specification.
- OpenTelemetry [Semantic Conventions for Events](https://opentelemetry.io/docs/specs/semconv/general/events/) specification.
- OpenTelemetry [OTLP Specification](https://opentelemetry.io/docs/specs/otlp/) specification.
- OpenTelemetry [RFC 5424 Syslog Data Model Mapping](https://opentelemetry.io/docs/specs/otel/logs/data-model-appendix/#rfc5424-syslog) appendix.
