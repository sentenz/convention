# 017-ADR: Security Event Log Specifications

Architectural Decision Record (ADR) on adopting OpenTelemetry as the canonical specification for security event logs.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. OpenTelemetry Logs Data Model and Events](#31-opentelemetry-logs-data-model-and-events)
  - [3.2. Project Security Semantic Conventions](#32-project-security-semantic-conventions)
  - [3.3. Collection and File Representation](#33-collection-and-file-representation)
  - [3.4. Optional Boundary Adapters](#34-optional-boundary-adapters)
  - [3.5. Security Controls](#35-security-controls)
- [4. Considered](#4-considered)
  - [4.1. OpenTelemetry Semantic Conventions and Logs Data Model](#41-opentelemetry-semantic-conventions-and-logs-data-model)
  - [4.2. Open Cybersecurity Schema Framework as the Canonical Specification](#42-open-cybersecurity-schema-framework-as-the-canonical-specification)
  - [4.3. RFC 5424 as the Canonical Specification](#43-rfc-5424-as-the-canonical-specification)
  - [4.4. Layered OpenTelemetry, OCSF, and RFC 5424](#44-layered-opentelemetry-ocsf-and-rfc-5424)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-08-17
- Status: Proposed

## 2. Context

First-party applications produce security-relevant occurrences such as authentication attempts, authorization decisions, configuration changes, and access to protected data. Free-form application messages do not provide a stable contract for detection, investigation, correlation, or audit because their names, fields, timestamps, severity, and wording can change independently.

This decision defines the canonical logical representation, semantic conventions, collection contract, and representative file fixture for first-party security event logs. It does not require every downstream analytics system or legacy integration to use the same physical encoding.

The [OpenTelemetry Logs Data Model](https://opentelemetry.io/docs/specs/otel/logs/data-model/) provides a stable, general-purpose event and log envelope. The [Semantic Conventions for Events](https://opentelemetry.io/docs/specs/semconv/general/events/) define an event as a LogRecord with an event name and specify how its name, timestamps, severity, attributes, and body are defined. The [General Logs Semantic Conventions](https://opentelemetry.io/docs/specs/semconv/general/logs/) provide reusable log attributes. OpenTelemetry does not yet define a comprehensive security-event catalogue, so project-specific security semantics remain necessary.

The decision is whether to adopt those OpenTelemetry specifications and extend them with governed project conventions, or to require additional canonical representations such as OCSF and RFC 5424 for every security event.

1. Decision Drivers

    - Single Source of Truth
      > Define one canonical event contract so producers, collectors, tests, and consumers do not disagree about which representation is authoritative.

    - Security Semantics
      > Represent security-relevant occurrences with stable event names, typed attributes, documented outcomes, and explicit sensitivity classifications.

    - Correlation
      > Correlate security events with services, hosts, users, processes, and distributed traces without parsing display messages.

    - Practicality
      > Reuse the telemetry data model, libraries, collectors, and transport already applicable to application logs rather than operating a mandatory normalization layer.

    - Fidelity and Provenance
      > Preserve event time, observation time, source identity, original severity labels, and semantic-convention versions.

    - Confidentiality and Data Minimization
      > Prevent credentials, tokens, cryptographic material, and unnecessary personal data from entering telemetry pipelines.

    - Integrity and Availability
      > Detect malformed or dropped records, protect events in transit and at rest, and make delivery failures observable.

    - Evolvability
      > Version project conventions independently while following OpenTelemetry compatibility and naming guidance.

    - Vendor Neutrality
      > Keep the canonical event contract portable across OpenTelemetry-compatible collectors, processors, and storage backends.

## 3. Decision

Adopt the OpenTelemetry Logs Data Model, Semantic Conventions for Events, and General Logs Semantic Conventions as the sole canonical specification for first-party security event logs. Extend them with a versioned project security-event catalogue; do not fork or redefine OpenTelemetry fields. OCSF and RFC 5424 are optional boundary adapters, not required representations of every event.

A representative authentication failure is maintained as a file-based OpenTelemetry fixture:

```text
fixtures/017-security-event-log-specifications/authentication.otlp.jsonl
```

The [authentication.otlp.jsonl](fixtures/017-security-event-log-specifications/authentication.otlp.jsonl) fixture contains one complete OTLP `LogsData` JSON value. It is a security log event example for conformance, replay, and review rather than application implementation code.

### 3.1. OpenTelemetry Logs Data Model and Events

Represent each structured security event as an OpenTelemetry EventRecord: a LogRecord with a non-empty `EventName`.

1. Event Contract

    - Set `EventName` to a stable, low-cardinality, fully qualified name that uniquely identifies the event structure. Dynamic values such as identifiers and outcomes belong in attributes.

    - Set `Timestamp` to the time the security-relevant occurrence happened. An SDK, collector, or other observing component sets `ObservedTimestamp`; it MUST NOT replace a known source timestamp.

    - Set `SeverityNumber` according to the OpenTelemetry severity ranges. Preserve a source-provided label in `SeverityText`, but do not define a fixed `SeverityText` in the semantic convention. Severity describes impact and is independent of outcome.

    - Put occurrence-specific, machine-readable facts in `Attributes`. Use `Body` only for an optional concise display message.

    - Put the identity of the entity that generated the event in `Resource` and the identity and version of the emitter in `InstrumentationScope`.

    - Populate `TraceId`, `SpanId`, and `TraceFlags` when valid trace context exists. Emit the security event as a LogRecord even when it is associated with a span so its retention does not depend on trace sampling.

    - Retain unstructured diagnostic messages as ordinary LogRecords without an `EventName`; do not misclassify every application log as a security event.

2. Versioning

    - Pin the supported OpenTelemetry specification, semantic-convention, SDK, and collector versions.

    - Record the project security-event catalogue version in `InstrumentationScope.version` and publish a Schema URL when a versioned OpenTelemetry schema is available for the project conventions.

    - Validate migrations before changing an event name, attribute name, type, requirement level, or enumerated value.

The Logs Data Model is stable. The general Events and Logs semantic conventions currently have `Development` status, so their versions and compatibility requirements require explicit governance.

### 3.2. Project Security Semantic Conventions

Maintain a project security-event catalogue that applies OpenTelemetry's semantic-convention rules to the security domain.

1. Reuse Before Extension

    - Reuse existing OpenTelemetry attributes such as `service.name`, `service.version`, `host.name`, `enduser.id`, `client.address`, and `error.type` when their documented meaning applies.

    - Define a custom attribute only when an existing OpenTelemetry attribute cannot express the required fact without changing its meaning.

2. Owned Namespaces

    - Put custom events and attributes in a collision-resistant project-owned namespace. The fixture uses `example.security.*` as a documentation namespace; deployed systems MUST replace it with their governed project or reverse-domain namespace.

    - Do not introduce project attributes under the reserved `otel.*` namespace or an existing OpenTelemetry namespace.

3. Catalogue Entry

    Each event definition MUST specify:

    - The event name and the precise condition under which it is recorded.

    - The source of `Timestamp` and the default `SeverityNumber`, including conditions that change severity.

    - Required, recommended, conditionally required, and opt-in attributes with their types, meanings, cardinality, and enumerated values.

    - Required resource identity and trace-correlation behavior.

    - Whether each field contains personal, credential-adjacent, high-cardinality, or otherwise sensitive data.

    - Display-message guidance for `Body`, compatibility guarantees, deprecation policy, and representative valid and invalid records.

For an authentication failure, the canonical facts include the stable `example.security.authentication` event name, the standard `enduser.id`, `client.address`, and `error.type` attributes, and the project-defined `example.security.authentication.outcome` attribute.

### 3.3. Collection and File Representation

1. Emission and Collection

    - Emit first-party events through an OpenTelemetry Logs API, SDK, or compatible logging bridge and send them to an OpenTelemetry Collector using OTLP where supported.

    - Map legacy and third-party records into the OpenTelemetry Logs Data Model at an ingestion boundary without changing known source semantics. Preserve the original record under a restricted policy when forensic or compatibility requirements justify it.

    - Apply enrichment, redaction, validation, routing, batching, and retry in observable stages. Each stage MUST expose rejected-record, dropped-record, queue-capacity, retry, and export-failure telemetry.

2. File Fixture

    - Store representative events using the [OpenTelemetry Protocol File Exporter](https://opentelemetry.io/docs/specs/otel/protocol/file-exporter/) JSON Lines representation.

    - Treat OTLP/JSON as the concrete fixture encoding and the OpenTelemetry Logs Data Model as the canonical logical contract. A file fixture does not prescribe the production storage backend.

    - Keep each line independently parseable as one complete OTLP `LogsData` JSON value and validate its protobuf JSON field names, numeric encodings, trace identifiers, and semantic attributes.

### 3.4. Optional Boundary Adapters

Additional specifications are introduced only for a demonstrated integration requirement and do not change the canonical OpenTelemetry record.

1. OCSF

    - Map selected security-relevant events to [OCSF](https://github.com/ocsf/ocsf-schema) only when a security analytics consumer requires OCSF or when heterogeneous sources require a shared cybersecurity taxonomy.

    - Maintain the mapping as a separately versioned adapter, validate the output against the pinned OCSF schema, and retain enough OpenTelemetry provenance to explain the transformation.

2. RFC 5424

    - Parse or produce [RFC 5424](https://www.rfc-editor.org/rfc/rfc5424) only at an actual syslog ingress or egress boundary.

    - Keep RFC 5424 out of the internal event contract and storage model. Define timestamp, severity, structured-data, size, truncation, and transport behavior in a versioned integration profile.

    - Use the TLS transport defined by [RFC 5425](https://www.rfc-editor.org/rfc/rfc5425) unless a documented threat model approves another transport.

When no consumer or source requires either format, no OCSF or RFC 5424 adapter is implemented.

### 3.5. Security Controls

- Data Minimization
  > Never record passwords, session secrets, API keys, private keys, raw authorization headers, or complete authentication tokens. Collect personal data only when its security value and retention policy are explicit.

- Access and Encryption
  > Encrypt security events in transit and at rest, separate producer, pipeline, analyst, and administrator permissions, and audit access to restricted raw records.

- Integrity and Provenance
  > Record source identity, instrumentation scope and version, collector identity, and processing timestamps. Use append-only or tamper-evident storage when required by the threat model or compliance obligations.

- Availability
  > Do not sample security events by default. Any aggregation, rate limit, or sampling policy requires an approved loss budget and telemetry that exposes discarded volume.

- Resource Safety
  > Bound attribute counts, value sizes, nesting, queue usage, and retry behavior. High-cardinality values belong in attributes, never in event names or metric labels.

- Clock Quality
  > Synchronize source and collector clocks, retain event and observation times, and alert on material clock skew.

- Failure Handling
  > Define whether each producer buffers, blocks, or degrades when the pipeline is unavailable. Security-control decisions MUST NOT depend on successful telemetry export unless that dependency is explicitly designed and tested.

## 4. Considered

### 4.1. OpenTelemetry Semantic Conventions and Logs Data Model

The selected option combines the [OpenTelemetry Logs Data Model](https://opentelemetry.io/docs/specs/otel/logs/data-model/), [Semantic Conventions for Events](https://opentelemetry.io/docs/specs/semconv/general/events/), and [General Logs Semantic Conventions](https://opentelemetry.io/docs/specs/semconv/general/logs/) with a project-owned security-event catalogue.

The [authentication.otlp.jsonl](fixtures/017-security-event-log-specifications/authentication.otlp.jsonl) fixture contains the following event, expanded for readability:

```json
{
  "resourceLogs": [
    {
      "resource": {
        "attributes": [
          {
            "key": "service.name",
            "value": {
              "stringValue": "identity-api"
            }
          },
          {
            "key": "service.version",
            "value": {
              "stringValue": "2.4.0"
            }
          },
          {
            "key": "host.name",
            "value": {
              "stringValue": "auth.example"
            }
          }
        ]
      },
      "scopeLogs": [
        {
          "scope": {
            "name": "example.security",
            "version": "1.0.0"
          },
          "logRecords": [
            {
              "timeUnixNano": "1786996800000000000",
              "observedTimeUnixNano": "1786996800250000000",
              "severityNumber": 13,
              "severityText": "WARN",
              "body": {
                "stringValue": "Authentication failed"
              },
              "attributes": [
                {
                  "key": "enduser.id",
                  "value": {
                    "stringValue": "user-123"
                  }
                },
                {
                  "key": "client.address",
                  "value": {
                    "stringValue": "192.0.2.10"
                  }
                },
                {
                  "key": "example.security.authentication.outcome",
                  "value": {
                    "stringValue": "failure"
                  }
                },
                {
                  "key": "error.type",
                  "value": {
                    "stringValue": "invalid_credentials"
                  }
                }
              ],
              "traceId": "4bf92f3577b34da6a3ce929d0e0e4736",
              "spanId": "00f067aa0ba902b7",
              "eventName": "example.security.authentication"
            }
          ]
        }
      ]
    }
  ]
}
```

OTLP/JSON uses lower-camel-case protobuf field names, integer enum values, decimal strings for 64-bit integers, and hexadecimal trace and span identifiers. These concrete names differ from the title-case logical fields in the Logs Data Model.

- Pros

  - Single Source of Truth
    > Uses one logical event representation throughout first-party emission, collection, processing, testing, and storage integration.

  - Correlation
    > Relates security events to resources, traces, spans, and instrumentation scopes without custom envelopes.

  - Practicality
    > Reuses OpenTelemetry APIs, SDKs, collectors, OTLP, and existing application telemetry operations.

  - Extensibility
    > Reuses standard attributes while allowing governed project security conventions where the upstream registry has no equivalent.

  - Portability
    > Decouples producers from a specific security analytics platform or storage backend.

- Cons

  - Security Taxonomy
    > The project must govern security event names, outcomes, requirement levels, and sensitive-data classifications that OpenTelemetry does not standardize.

  - Maturity
    > The general Events and Logs semantic conventions have `Development` status and require pinned versions and compatibility review.

  - Boundary Translation
    > Consumers that require OCSF or syslog still need separately governed adapters.

### 4.2. Open Cybersecurity Schema Framework as the Canonical Specification

[OCSF](https://github.com/ocsf/ocsf-schema) provides a vendor-neutral cybersecurity taxonomy, event classes, reusable objects, profiles, and normalized attributes.

- Pros

  - Security Semantics
    > Enables consistent detection and investigation across heterogeneous security products and event sources.

  - Vendor Neutrality
    > Separates normalized security meaning from a specific analytics or storage vendor.

  - Extensibility
    > Supports profiles and extensions while retaining a common core schema.

- Cons

  - Collection
    > Is intentionally agnostic to application instrumentation, collection, transport, trace correlation, and storage.

  - Producer Complexity
    > Requiring every application to construct OCSF records duplicates mapping logic and couples business code to a downstream analytics taxonomy.

  - Dual Contract
    > General application telemetry would still require another envelope, making OCSF an additional canonical representation rather than the single source of truth.

### 4.3. RFC 5424 as the Canonical Specification

[RFC 5424](https://www.rfc-editor.org/rfc/rfc5424) standardizes a widely supported syslog message format with extensible structured data.

- Pros

  - Interoperability
    > Integrates with operating systems, appliances, and established syslog infrastructure.

  - Simplicity
    > Provides a compact envelope with familiar facility, severity, source, and message fields.

- Cons

  - Security Semantics
    > Does not provide a comprehensive cybersecurity taxonomy or standardized event catalogue.

  - Correlation
    > Has no native resource and trace-correlation model equivalent to OpenTelemetry.

  - Reliability and Storage
    > Defines neither delivery acknowledgement nor a storage format; transport and persistence guarantees require additional specifications.

  - Extension Governance
    > Vendor-specific structured data does not by itself create semantic interoperability.

### 4.4. Layered OpenTelemetry, OCSF, and RFC 5424

This option makes OpenTelemetry canonical for emission and collection, OCSF canonical for security analytics, and RFC 5424 a standard exchange representation.

- Pros

  - Heterogeneous Analytics
    > Supplies a shared security taxonomy when multiple unrelated products and sources must be normalized before analysis.

  - Established Boundaries
    > Accommodates consumers and devices that mandate OCSF or syslog.

- Cons

  - Complexity
    > Requires mapping registries, validators, schema-version coordination, replay tests, failure paths, and operational monitoring even when no current integration needs them.

  - Multiple Sources of Truth
    > Calling both OpenTelemetry and OCSF canonical makes ownership of event meaning and compatibility ambiguous.

  - Fidelity and Cost
    > Transformations can lose or reinterpret data, while retaining multiple forms increases processing, storage, privacy, and access-control obligations.

This option is rejected as the default. Its OCSF and RFC 5424 components may be implemented independently under [Optional Boundary Adapters](#34-optional-boundary-adapters) when concrete requirements justify their cost.

## 5. Consequences

- Positive

  - First-party security events use one canonical logical model from emission through collection.

  - Event names, attributes, timestamps, severity, resource identity, instrumentation version, and trace correlation are machine-readable and testable.

  - The event pipeline remains compatible with OpenTelemetry tooling and independent of a specific security analytics or storage vendor.

  - OCSF and RFC 5424 complexity is introduced only at boundaries that demonstrate a need for it.

  - One representative fixture is sufficient to validate the selected contract without implying that transformed representations are mandatory.

- Negative

  - The project owns the security-event catalogue and must govern its definitions, compatibility, and sensitive-data classifications.

  - Cross-vendor security analytics does not receive an OCSF taxonomy unless a normalization adapter is implemented.

  - Syslog-only sources and consumers require explicit ingress or egress profiles.

  - Changes in developing OpenTelemetry Events and Logs conventions may require controlled migrations.

- Risks

  - Sensitive Data Leakage
    > Structured attributes can expose secrets or personal data at scale. Mitigate with source-side allowlists, data classification, redaction, restricted access, and adversarial fixture tests.

  - Semantic Drift
    > Independently defined events can diverge in naming, outcome, identity, or severity. Mitigate with a reviewed catalogue, reusable attributes, schema versions, and CI validation.

  - Silent Event Loss
    > Queue overflow, sampling, malformed records, or exporter failure can create false confidence. Mitigate with durable buffering where required, loss telemetry, alerts, dead-letter handling, and reconciliation tests.

  - Schema Collision
    > Project attributes may conflict with future upstream conventions. Mitigate with an owned namespace, versioned migrations, and periodic review of the OpenTelemetry registry.

  - Source Spoofing
    > Application-supplied resource attributes may be forged. Mitigate with authenticated transport, collector-supplied workload identity, trusted-source metadata, and explicit conflict-resolution rules.

## 6. Implementation

1. Inventory Security Events

    Catalogue events required for detection, investigation, incident response, and audit. Record each source, control objective, sensitivity, expected volume, retention class, and loss tolerance.

2. Define the Security-Event Catalogue

    Define each event using the OpenTelemetry semantic-convention model. Record its stable name, occurrence condition, timestamp source, default severity, attributes and requirement levels, resource requirements, trace behavior, sensitivity, examples, and lifecycle.

3. Reuse and Namespace Attributes

    Review the current OpenTelemetry registry before adding a field. Replace custom duplicates with existing attributes and place necessary extensions in the governed project namespace.

4. Instrument Producers

    Configure OpenTelemetry Logs APIs, SDKs, or compatible bridges for first-party services. Emit structured EventRecords independently of trace sampling and pin instrumentation-scope versions.

5. Build the Collection Pipeline

    Send events over OTLP to collectors that apply trusted-source enrichment, redaction, validation, size limits, buffering, and routing. Monitor rejected, dropped, retried, and failed records.

6. Add Conformance Gates

    Validate the JSON Lines fixture as OTLP/JSON and test event names, attribute types, requirement levels, prohibited-data rules, severity, timestamps, trace identifiers, and backward compatibility in CI.

7. Add Boundary Adapters on Demand

    Introduce and separately version an OpenTelemetry-to-OCSF mapping or an RFC 5424 profile only after documenting the source or consumer that requires it, the fields that cannot be represented losslessly, and its validation and monitoring obligations.

8. Apply Storage and Access Controls

    Define retention by event class and sensitivity. Encrypt stored records, restrict access, audit privileged queries, and enable append-only or tamper-evident controls where required.

9. Exercise Failure Modes

    Test malformed input, unavailable collectors, queue exhaustion, duplicate delivery, clock skew, oversized attributes, schema upgrades, and replay. Verify alerts and recovery without losing provenance.

10. Review Compatibility

    Review the event catalogue and pinned OpenTelemetry versions whenever a release changes security telemetry. Treat event or attribute incompatibilities as schema migrations rather than incidental logging changes.

## 7. References

- Issue [#526: Create an ADR on Security Event Log Specifications](https://github.com/sentenz/convention/issues/526) issue.
- IETF [RFC 5424: The Syslog Protocol](https://www.rfc-editor.org/rfc/rfc5424) standard.
- IETF [RFC 5425: Transport Layer Security (TLS) Transport Mapping for Syslog](https://www.rfc-editor.org/rfc/rfc5425) standard.
- OCSF [schema repository](https://github.com/ocsf/ocsf-schema) repository.
- OpenTelemetry [Logging](https://opentelemetry.io/docs/specs/otel/logs/) specification.
- OpenTelemetry [Logs Data Model](https://opentelemetry.io/docs/specs/otel/logs/data-model/) specification.
- OpenTelemetry [Semantic Conventions](https://opentelemetry.io/docs/specs/semconv/) specification.
- OpenTelemetry [Semantic Conventions for Events](https://opentelemetry.io/docs/specs/semconv/general/events/) specification.
- OpenTelemetry [General Logs Semantic Conventions](https://opentelemetry.io/docs/specs/semconv/general/logs/) specification.
- OpenTelemetry [Semantic Convention Naming](https://opentelemetry.io/docs/specs/semconv/general/naming/) guidance.
- OpenTelemetry [How to Write Semantic Conventions](https://opentelemetry.io/docs/specs/semconv/how-to-write-conventions/) guidance.
- OpenTelemetry [OTLP Specification](https://opentelemetry.io/docs/specs/otlp/) specification.
- OpenTelemetry [Protocol File Exporter](https://opentelemetry.io/docs/specs/otel/protocol/file-exporter/) specification.
- OpenTelemetry [RFC 5424 Syslog Data Model Mapping](https://opentelemetry.io/docs/specs/otel/logs/data-model-appendix/#rfc5424-syslog) appendix.
