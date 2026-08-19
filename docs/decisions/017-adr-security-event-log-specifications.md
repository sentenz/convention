# 017-ADR: Security Event Log Specifications

Architectural Decision Records (ADR) on standardizing Security Event Log Specifications using RFC 5424, OCSF, and OpenTelemetry.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. RFC 5424 (Syslog Protocol)](#31-rfc-5424-syslog-protocol)
  - [3.2. Open Cybersecurity Schema Framework (OCSF)](#32-open-cybersecurity-schema-framework-ocsf)
  - [3.3. OpenTelemetry Specification](#33-opentelemetry-specification)
- [4. Considered](#4-considered)
  - [4.1. RFC 5424 (Syslog Protocol)](#41-rfc-5424-syslog-protocol)
  - [4.2. OCSF (Open Cybersecurity Schema Framework)](#42-ocsf-open-cybersecurity-schema-framework)
  - [4.3. OpenTelemetry (OTel)](#43-opentelemetry-otel)
  - [4.4. CEF / LEEF](#44-cef--leef)
  - [4.5. ECS (Elastic Common Schema)](#45-ecs-elastic-common-schema)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-08-19
- Status: Proposed

## 2. Context

Security event logging is a foundational capability for threat detection, incident response, compliance auditing, and operational visibility. Modern applications produce security-relevant occurrences such as authentication attempts, authorization decisions, configuration changes, and access to protected data. A standardized security event log specification must define transport mechanisms, data schemas, and collection frameworks that are interoperable, extensible, and vendor-neutral.

1. Decision Drivers

    - Interoperability
      > The specification must enable seamless exchange of security events between heterogeneous systems, platforms, and tools.

    - Standards Compliance
      > The specification must align with recognized industry standards and support compliance with regulatory frameworks (CRA, IEC 62443-4-2, ISO/IEC 27001, NIST CSF).

    - Rich Semantics
      > The specification must provide a comprehensive taxonomy of security event types with well-defined fields, supporting detailed forensic analysis.

    - Scalability
      > The specification must support high-volume ingestion and efficient processing for large-scale deployments.

    - Vendor Neutrality
      > The specification must avoid dependence on a single vendor's ecosystem, ensuring portability and long-term sustainability.

    - Telemetry Correlation
      > The specification must support correlation of security events with other telemetry signals (metrics, traces) for unified observability.

## 3. Decision

### 3.1. RFC 5424 (Syslog Protocol)

RFC 5424 is selected as the transport and base formatting standard for security event log message delivery. It provides a universally deployed protocol with structured data support, severity/facility classification, and reliable transport options (TCP/TLS).

1. Rationale

    - Interoperability
      > RFC 5424 is the IETF standard for syslog, supported natively by virtually every operating system, network device, and security appliance, ensuring broad compatibility.

    - Standards Compliance
      > As an IETF standards-track protocol, RFC 5424 provides a recognized and stable foundation that satisfies regulatory requirements for structured logging.

    - Scalability
      > The protocol supports reliable transport over TCP and TLS (RFC 5425, RFC 6587), enabling secure and ordered delivery of high-volume log streams.

### 3.2. Open Cybersecurity Schema Framework (OCSF)

OCSF is selected as the canonical security event schema for normalizing security-relevant events. It provides a comprehensive, vendor-neutral taxonomy of event types covering firewall, network traffic, identity, endpoint, cloud, and data security domains.

1. Rationale

    - Rich Semantics
      > OCSF defines detailed JSON schemas for over 30 security event types, each with normative fields, severity levels, and outcome enumerations, enabling precise forensic analysis.

    - Vendor Neutrality
      > OCSF is developed as an open specification by a consortium of security vendors and is hosted as a CNCF-adjacent project, ensuring multi-vendor governance.

    - Interoperability
      > The JSON-native format with open API (OpenAPI) schema definitions simplifies parsing, validation, and integration with SIEM, SOAR, and analytics platforms.

### 3.3. OpenTelemetry Specification

OpenTelemetry is selected as the unified telemetry data model and collection framework for instrumenting applications and ingesting security events. It provides vendor-neutral log/event collection via the OTLP protocol with built-in correlation to traces and metrics.

1. Rationale

    - Telemetry Correlation
      > OpenTelemetry's unified data model enables correlation of security logs with distributed traces and metrics, providing end-to-end visibility across the full-stack observability pipeline.

    - Vendor Neutrality
      > As a CNCF graduate project, OpenTelemetry ensures vendor-neutral instrumentation, preventing lock-in to a specific observability backend.

    - Scalability
      > The OpenTelemetry Collector provides a scalable, pluggable architecture for log ingestion, transformation, and export, supporting high-throughput environments.

    - Standards Compliance
      > OpenTelemetry aligns with RFC 5424 for log severity mapping and supports structured log attributes that can carry OCSF-normalized event data.

## 4. Considered

### 4.1. RFC 5424 (Syslog Protocol)

[RFC 5424 - The Syslog Protocol](https://datatracker.ietf.org/doc/html/rfc5424) is the IETF standard that defines the protocol for message logging, replacing the older BSD syslog and RFC 3164 (syslog-protocol). It introduces structured data, mandatory headers, and message framing for reliable parsing.

```syslog
<165>1 2026-08-19T05:55:00.000Z myhost example.com evmsecid 456 [exampleSDID@32470 iut="3" eventCategory="authentication" severity="critical"] Failed login attempt for user admin from 192.168.1.100
```

- Pros

  - Universal Adoption
    > Supported natively by virtually every operating system, network device, and security appliance, ensuring broad compatibility across heterogeneous environments.

  - Structured Data Mechanism
    > The SD-ELEMENT syntax (`[SD-ID SD-PARAM]`) allows extensible structured metadata without breaking backward compatibility with plain-text MSG parsers.

  - Severity & Facility Classification
    > The PRI encoded header (`<PRI>`) provides 16 facilities × 8 severity levels, enabling lightweight routing and prioritization at the transport layer.

  - Standards-Track Protocol
    > As an IETF Internet Standard, RFC 5424 provides a stable, long-lived specification with well-defined conformance requirements.

- Cons

  - Limited Security-Specific Semantics
    > The protocol defines transport and framing but provides no normative schema for security event fields (e.g., source IP, user identity, action outcome), requiring custom SD-ELEMENT definitions.

  - No Native Correlation
    > RFC 5424 lacks built-in support for trace IDs, span IDs, or other correlation identifiers needed to link log events to distributed traces.

  - Parsing Complexity
    > The structured-data grammar is flexible but non-trivial to parse correctly, leading to inconsistencies across syslog implementations.

### 4.2. OCSF (Open Cybersecurity Schema Framework)

[OCSF (Open Cybersecurity Schema Framework)](https://ocsf.io/) is an open, vendor-neutral specification that defines a comprehensive set of JSON schemas for security events, covering domains such as firewall, network traffic, identity, endpoint, cloud, and data security.

```json
{
  "time": 1787201700000,
  "category_uid": 4,
  "class_uid": 2,
  "type_uid": 1,
  "severity_id": 3,
  "status_id": 2,
  "status": "Failure",
  "status_detail": "INVALID_CREDENTIALS",
  "message": "Failed login attempt for user admin from 192.168.1.100",
  "activity_id": 1,
  "user": {
    "name": "admin"
  },
  "src_endpoint": {
    "ip": "192.168.1.100",
    "port": 52341
  },
  "dst_endpoint": {
    "name": "auth-server-01",
    "ip": "10.0.1.50"
  },
  "metadata": {
    "version": "1.0.0",
    "collector": {
      "hostname": "auth-server-01"
    }
  }
}
```

- Pros

  - Rich Security Event Taxonomy
    > Defines normative schemas for 30+ event types across multiple security domains (firewall, identity, endpoint, cloud, DNS, HTTP), each with well-typed fields and enumerated values.

  - Vendor-Neutral Governance
    > Developed collaboratively by leading security vendors (Palo Alto Networks, CrowdStrike, Elastic, Google, Microsoft) and maintained as an open specification, reducing vendor lock-in.

  - JSON-Native Format
    > Schemas are defined using OpenAPI 3.0, enabling automatic code generation, validation, and seamless integration with modern data pipelines and SIEM platforms.

  - Consistent Patterns
    > Common fields (`time`, `category_uid`, `class_uid`, `type_uid`, `severity_id`, `status_id`, `status`, `message`, `metadata`) are inherited from `base_event` across all event classes, simplifying parser development and query writing.

- Cons

  - Evolving Specification
    > OCSF is relatively new (1.0 released in 2024), with schemas still undergoing versioned updates; downstream consumers must handle schema versioning and backward compatibility.

  - Adoption Still Growing
    > While major vendors have committed to OCSF, the breadth of native support across the security toolchain is not yet as universal as CEF or ECS.

  - No Transport Protocol
    > OCSF defines event schemas but not a transport mechanism; it must be combined with a delivery protocol (e.g., RFC 5424, OTLP, or Kafka).

### 4.3. OpenTelemetry (OTel)

[OpenTelemetry (OTel)](https://opentelemetry.io/docs/) is a CNCF graduate project that provides a unified framework for instrumenting, generating, collecting, and exporting telemetry data (traces, metrics, and logs). The specification defines a vendor-neutral data model and the OTLP protocol for transport.

```json
{
  "resourceLogs": [
    {
      "resource": {
        "attributes": [
          {
            "key": "resource-attr",
            "value": {
              "stringValue": "resource-attr-val-1"
            }
          }
        ]
      },
      "scopeLogs": [
        {
          "scope": {},
          "logRecords": [
            {
              "timeUnixNano": "1581452773000000789",
              "severityNumber": 9,
              "severityText": "Info",
              "body": {
                "stringValue": "This is a log message"
              },
              "attributes": [
                {
                  "key": "app",
                  "value": {
                    "stringValue": "server"
                  }
                },
                {
                  "key": "instance_num",
                  "value": {
                    "intValue": "1"
                  }
                }
              ],
              "droppedAttributesCount": 1,
              "traceId": "08040201000000000000000000000000",
              "spanId": "0102040800000000"
            },
            {
              "timeUnixNano": "1581452773000000789",
              "severityNumber": 9,
              "severityText": "Info",
              "body": {
                "stringValue": "something happened"
              },
              "attributes": [
                {
                  "key": "customer",
                  "value": {
                    "stringValue": "acme"
                  }
                },
                {
                  "key": "env",
                  "value": {
                    "stringValue": "dev"
                  }
                }
              ],
              "droppedAttributesCount": 1,
              "traceId": "",
              "spanId": ""
            }
          ]
        }
      ]
    }
  ]
}
```

- Pros

  - Unified Telemetry Model
    > Provides a single data model and SDK for traces, metrics, and logs, enabling seamless correlation between security events and application performance data.

  - Vendor-Neutral
    > As a CNCF graduate project, OpenTelemetry ensures that instrumentation code is not tied to a specific observability backend or vendor.

  - OTLP Transport
    > The OpenTelemetry Protocol (OTLP) over HTTP/2 or gRPC provides efficient, binary-encoded transport with native support for batching, compression, and back-pressure.

  - Trace/Log Correlation
    > Log records can carry `trace_id` and `span_id` attributes, enabling direct pivoting from a security event to the corresponding distributed trace.

  - Pluggable Collector
    > The OpenTelemetry Collector provides a scalable architecture with processors, transformers, and exporters, supporting log normalization and routing.

- Cons

  - Not Security-Specific
    > OpenTelemetry's data model is general-purpose and does not define security event schemas natively; it must be combined with OCSF for rich security semantics.

  - Attribute Mapping Overhead
    > Embedding OCSF fields as OpenTelemetry log attributes requires careful mapping to preserve type fidelity and query efficiency.

  - Learning Curve
    > Teams must learn OpenTelemetry instrumentation patterns, Collector configuration, and signal routing, which adds initial complexity.

### 4.4. CEF / LEEF

[CEF (Common Event Format)](https://learn.microsoft.com/en-us/azure/sentinel/cef-name-mapping) is a device-agnostic language used to represent security events. [LEEF (Log Event Extended Format)](https://www.ibm.com/) is IBM QRadar's equivalent flat-line log format. Both are key-value pair formats appended to a format header.

```cef
CEF:0|ALKL|AuthGateway|2.1.0|1001|Failed Login|5|rt=2026-08-19T05:55:00Z src=192.168.1.100 spt=52341 user=admin msg=Failed login attempt act=authentication outcome=failure severity=high cnt=3
```

```leef
LEEF:1|ALKL|AuthGateway|2.1.0|FailedLogin|Failed login attempt for user admin--DeviceClassification=Security DeviceProduct=AuthGateway DeviceVersion=2.1.0 EventCount=1 Severity=5 SrcEndpointAddress=192.168.1.100 SrcEndpointPort=52341 UserName=admin Result=Failure Reason=invalid_password AttemptCount=3
```

- Pros

  - SIEM Integration
    > CEF and LEEF are widely supported by enterprise SIEM platforms (ArcSight, QRadar), with built-in parsers and correlation rules.

  - Flat-Line Format
    > The single-line key-value format is easy to generate from legacy systems and simple to transport over syslog.

- Cons

  - Proprietary Governance
    > CEF is owned by Micro Focus and LEEF by IBM, creating vendor lock-in and limiting the ability to evolve the formats openly.

  - Limited Schema Flexibility
    > The flat key-value structure lacks hierarchical nesting, type enforcement, and validation, leading to inconsistent field naming and parsing errors.

  - Deprecated Trajectory
    > Both formats are in maintenance mode, with the industry migrating toward OCSF as the open replacement for security event normalization.

  - No Open Schema Registry
    > Unlike OCSF, CEF and LEEF do not provide open API schema definitions or automated validation tooling.

### 4.5. ECS (Elastic Common Schema)

[Elastic Common Schema (ECS)](https://www.elastic.co/guide/en/ecs/current/index.html) is an open publishing standard maintained by Elastic that defines common field naming and hierarchical structure for logging and data storage, widely used with the Elastic Stack (ELK).

```json
{
  "@timestamp": "2019-08-06T14:08:40.199Z",
  "log.level": "DEBUG",
  "message": "init find form",
  "service.name": "spring-petclinic",
  "process.thread.name": "http-nio-8080-exec-8",
  "log.logger": "org.springframework.samples.petclinic.owner.OwnerController",
  "transaction.id": "28b7fb8d5aba51f1",
  "trace.id": "2869b25b5469590610fea49ac04af7da"
}
```

- Pros

  - Mature Schema
    > ECS has been in production use since 2018, with a stable field hierarchy covering logging, networking, hosting, and security domains.

  - Elastic Stack Integration
    > Native support in Elasticsearch, Logstash, and Filebeat simplifies deployment for organizations using the Elastic platform.

  - Community Adoption
    > Many open-source projects and vendors provide ECS-compatible exporters and documentation.

- Cons

  - Vendor-Centric Governance
    > ECS is maintained by Elastic, a commercial vendor, which raises concerns about long-term vendor neutrality compared to multi-vendor specifications like OCSF.

  - Limited Security Event Depth
    > ECS provides general-purpose field naming but lacks the depth of security-specific event types defined by OCSF (e.g., firewall rule actions, DNS query types, cloud resource metadata).

  - Elastic Ecosystem Bias
    > While ECS can be used outside Elastic, its design and tooling are optimized for the Elastic Stack, reducing portability to other backends.

## 5. Consequences

- Positive

  - Interoperable Logging
    > Combining RFC 5424 (transport), OCSF (schema), and OpenTelemetry (collection) provides a comprehensive, interoperable logging stack that bridges legacy infrastructure and modern cloud-native applications.

  - Standardized Security Event Taxonomy
    > OCSF normalization ensures consistent field naming, type enforcement, and event classification across all security data sources, improving query reliability and analyst efficiency.

  - Telemetry Correlation
    > OpenTelemetry's unified data model enables correlation of security events with distributed traces and metrics, accelerating root cause analysis for security incidents.

  - Compliance Support
    > Structured, auditable logs aligned with recognized standards (RFC 5424, OCSF) satisfy requirements from CRA, ISO/IEC 27001, and NIST CSF for log integrity, retention, and accessibility.

  - Vendor Neutrality
    > The hybrid approach avoids dependence on a single vendor's ecosystem, ensuring portability of security event data across SIEM, SOAR, and observability platforms.

- Negative

  - Integration Complexity
    > Maintaining mappings between three standards (RFC 5424 SD-ELEMENTS, OCSF schemas, OpenTelemetry attributes) adds architectural complexity and operational overhead.

  - Learning Curve
    > Teams must become proficient in OCSF event schemas, OpenTelemetry instrumentation, and syslog configuration, increasing onboarding time.

  - Schema Versioning
    > OCSF schema evolution requires version-aware consumers and periodic migration of parsing rules, dashboards, and correlation logic.

  - Initial Instrumentation Effort
    > Existing applications must be instrumented with OpenTelemetry SDKs and configured to emit OCSF-normalized events, requiring development investment.

- Risks

  - OCSF Maturity
    > As a newer specification, OCSF schemas may undergo breaking changes. Mitigation: Implement schema version detection and maintain backward-compatible parsers.

  - Syslog Transport Limitations
    > RFC 5424 over UDP may lose messages under high load. Mitigation: Enforce TCP/TLS transport (RFC 5425/6587) for all security event streams.

  - Collector Bottleneck
    > The OpenTelemetry Collector may become a single point of failure under high-throughput scenarios. Mitigation: Deploy the Collector in highly-available mode with horizontal scaling and dedicated log pipelines.

## 6. Implementation

1. Define OCSF Event Schema Mappings

    Map security-relevant data sources (firewalls, identity providers, endpoints, cloud services) to corresponding OCSF event types and schemas. Document field mappings in a central registry.

2. Deploy OpenTelemetry Collector

    Deploy the OpenTelemetry Collector in the observability pipeline with OTLP receivers for log ingestion, configuring processors for OCSF normalization and attribute transformation.

3. Configure RFC 5424 Syslog Forwarding

    Configure security event sources to forward logs via RFC 5424 structured syslog over TCP/TLS to the collection pipeline, ensuring PRI-encoded severity and facility alignment.

4. Implement OCSF Normalization Pipeline

    Build transformation logic within the OpenTelemetry Collector (using the transformer processor or custom extensions) to map incoming syslog and application logs to OCSF-normalized JSON event structures.

5. Validate Schema Conformance

    Implement schema validation in the CI/CD pipeline using OCSF OpenAPI schemas to verify that emitted events conform to the specified structure, rejecting non-compliant payloads.

6. Integrate with SIEM and Observability Backends

    Configure exporters in the OpenTelemetry Collector to route OCSF-normalized security events to the SIEM platform and observability backend (e.g., Grafana Loki per ADR NNN-Full Stack Observability).

7. Update Documentation and Training

    Document the security event log specification, including event type catalog, field mappings, and instrumentation guides. Conduct training sessions for development and security operations teams.

## 7. References

- RFC 5424 [The Syslog Protocol](https://datatracker.ietf.org/doc/html/rfc5424) IETF specification.
- RFC 5425 [Transmission of Syslog Messages over TCP](https://datatracker.ietf.org/doc/html/rfc5425) IETF specification.
- RFC 6587 [Transport over TLS for Syslog](https://datatracker.ietf.org/doc/html/rfc6587) IETF specification.
- Open Cybersecurity Schema Framework [OCSF](https://ocsf.io/) specification.
- GitHub [OCSF Schema](https://github.com/ocsf/ocsf-schema) repository.
- OpenTelemetry [Specification](https://opentelemetry.io/docs/) documentation.
- OpenTelemetry [Log Data Model](https://opentelemetry.io/docs/specs/otel/logs/data-model/) specification.
- OpenTelemetry [OTLP Protocol](https://opentelemetry.io/docs/specs/otel/protocol/otlp/) specification.
- Elastic Common Schema [ECS](https://www.elastic.co/guide/en/ecs/current/index.html) documentation.
