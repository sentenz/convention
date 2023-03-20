# Data Serialization Formats

Data serialization formats are used to convert complex data structures into a format that can be easily transmitted over a network or stored in a persistent storage medium.

- [1. Category](#1-category)
  - [1.1. Text-based](#11-text-based)
    - [1.1.1. JSON](#111-json)
    - [1.1.2. XML](#112-xml)
    - [1.1.3. YAML](#113-yaml)
    - [1.1.4. TOML](#114-toml)
  - [1.2. Binary](#12-binary)
    - [1.2.1. Protocol Buffers](#121-protocol-buffers)
    - [1.2.2. MessagePack](#122-messagepack)
    - [1.2.3. Avro](#123-avro)
    - [1.2.4. BSON](#124-bson)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)

## 1. Category

Serialization formats are optimized for specific use cases, programming languages, and platforms. Some formats may be more suitable for certain types of data, such as numeric data or text data, while others may be better suited for large or complex data sets. The choice of serialization format will depend on a range of factors, such as the requirements for data transfer and storage, the available tools and libraries, and the constraints of the system being used.

### 1.1. Text-based

Text-based data serialization formats encode data in a human-readable text format, such as JSON, XML, YAML, and TOML. Text-based formats are widely used for data interchange and storage, as they are easy to read and write, and can be edited using a simple text editor. They are also platform-independent, meaning they can be used on any platform that supports the format.

#### 1.1.1. JSON

JSON (JavaScript Object Notation) is a text-based data serialization format that is commonly used for web applications and REST APIs. It is based on a subset of the JavaScript programming language, and is designed to be lightweight, easy to read and write, and easy to parse. JSON supports a variety of data types, including strings, numbers, boolean values, arrays, and objects.

```json
{
  "name": "John Doe",
  "age": 35,
  "isMarried": false,
  "hobbies": ["reading", "writing", "running"],
  "address": {
    "street": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "zip": "12345"
  }
}
```

#### 1.1.2. XML

XML (Extensible Markup Language) is a text-based data serialization format that is commonly used for data exchange and storage. It is based on a set of rules for encoding documents in a format that is both human-readable and machine-readable. XML supports a variety of data types, including text, numbers, boolean values, arrays, and objects.

```xml
<person>
  <name>John Doe</name>
  <age>35</age>
  <isMarried>false</isMarried>
  <hobbies>
    <hobby>reading</hobby>
    <hobby>writing</hobby>
    <hobby>running</hobby>
  </hobbies>
  <address>
    <street>123 Main St</street>
    <city>Anytown</city>
    <state>CA</state>
    <zip>12345</zip>
  </address>
</person>
```

#### 1.1.3. YAML

YAML (YAML Ain't Markup Language): YAML is a text-based data serialization format that is designed to be human-readable and easy to write. It is often used for configuration files and data exchange between systems. YAML uses indentation and whitespace to define the structure of the data being serialized. It supports a variety of data types, including strings, numbers, boolean values, arrays, and objects.

```yaml
name: John Doe
age: 35
isMarried: false
hobbies:
  - reading
  - writing
  - running
address:
  street: 123 Main St
  city: Anytown
  state: CA
  zip: '12345' 
```

#### 1.1.4. TOML

TOML (Tom's Obvious, Minimal Language) is a text-based data serialization format that is designed to be easy to read and write, while still being expressive enough to handle complex data structures. It is often used for configuration files and data exchange between systems. TOML uses a key-value pair syntax to define the structure of the data being serialized. It supports a variety of data types, including strings, numbers, boolean values, arrays, and objects.

```toml
name = "John Doe"
age = 35
isMarried = false

[hobbies]
hobbies = ["reading", "writing", "running"]

[address]
street = "123 Main St"
city = "Anytown"
state = "CA"
zip = "12345"
```

### 1.2. Binary

Binary data serialization formats encode data in binary format, which is more compact and efficient than text-based formats. Examples of binary serialization formats include Protocol Buffers, Apache Thrift, BSON, and Avro. Binary formats are often used for high-performance computing and data-intensive applications, where efficiency and speed are critical.

#### 1.2.1. Protocol Buffers

Protocol Buffers is a binary data serialization format that is designed to be compact, efficient, and extensible. It was developed by Google and is used extensively in Google's own software systems. Protocol Buffers uses a language-agnostic schema to define the structure of the data being serialized.

```java
message Person {
  string name = 1;
  int32 age = 2;
  bool is_married = 3;
  repeated string hobbies = 4;
  Address address = 5;
}

message Address {
  string street = 1;
  string city = 2;
  string state = 3;
  string zip = 4;
}
```

#### 1.2.2. MessagePack

MessagePack is a binary data serialization format that is designed to be fast, compact, and efficient. It is often used for real-time data exchange and storage, and supports a wide range of programming languages. MessagePack uses a simple binary format to encode data, with support for a variety of data types, including integers, floating-point numbers, boolean values, arrays, and maps.

```css
\x85\xa4name\xa7John Doe\xa3age\x23\x23\x00\xa9isMarried\xc3\xa7hobbies\x93\xa7reading\xa7writing\xa6running\xa7address\x84\xa6street\xab123 Main St\xa4city\xa7Anytown\xa5state\xa2CA\xa3zip\xcd\x00\x01\xe2
```

#### 1.2.3. Avro

Avro is a binary data serialization format that is designed to be efficient, extensible, and schema-based. It is often used for high-performance data processing and storage, and is widely used in the Apache Hadoop ecosystem. Avro uses a schema to define the structure of the data being serialized, and supports a variety of data types, including strings, integers, floating-point numbers, boolean values, arrays, and maps.

```json
{
  "namespace": "example.avro",
  "type": "record",
  "name": "Person",
  "fields": [
    {"name": "name", "type": "string"},
    {"name": "age", "type": "int"},
    {"name": "isMarried", "type": "boolean"},
    {"name": "hobbies", "type": {"type": "array", "items": "string"}},
    {"name": "address", "type": {
      "type": "record",
      "name": "Address",
      "fields": [
        {"name": "street", "type": "string"},
        {"name": "city", "type": "string"},
        {"name": "state", "type": "string"},
        {"name": "zip", "type": "string"}
      ]
    }}
  ]
}
```

#### 1.2.4. BSON

BSON (Binary JSON) is a binary data serialization format that is designed to be efficient, flexible, and easy to parse. It is often used for data storage and transmission in high-performance systems like MongoDB. BSON uses a binary encoding to represent data, with support for a variety of data types, including strings, integers, floating-point numbers, boolean values, arrays, and objects.

```css
\x48\x00\x00\x00\x04name\x00\x0BJane Doe\x00\x05age\x00\x1F\x00\x00\x00\x08is_married\x00\x01\x08hobbies\x00\x1C\x00\x00\x00\x020\x00\x07reading\x00\x07writing\x00\x06running\x00\x08address\x00\x1E\x00\x00\x00\x03street\x00\x0F123 Main St\x00\x04city\x00\x07Anytown\x00\x05state\x00\x02CA\x00\x03zip\x00\x05\x31\x32\x33\x34\x35\x00
```

## 2. Principle

Principles are essential to ensure that data serialization formats are reliable, flexible, and scalable for use in a wide range of systems and applications.

- Compactness
  > Serialization formats should be designed to produce compact representations of data, which minimize storage space and transmission bandwidth. Compactness is particularly important in distributed systems, where large amounts of data may need to be transmitted across networks with limited bandwidth.

- Portability
  > Serialization formats should be designed to be portable across different platforms, programming languages, and operating systems. This helps ensure that data can be exchanged between different systems without requiring custom code or data translation.

- Efficiency
  > Data serialization formats should be efficient in terms of memory usage and processing time. This is especially important for large-scale systems where data needs to be transmitted and processed quickly.

- Flexibility
  > Data serialization formats should be flexible enough to support a wide range of data types and structures. This includes support for nested structures, arrays, and other complex data structures.

- Interoperability
  > Serialization formats should be designed to be interoperable with other data formats, protocols, and systems. This helps ensure that data can be integrated with other systems and data sources, and can be used in a variety of applications and contexts.

- Readability
  > Data serialization formats should be readable and easy to understand by humans. This is important for debugging, troubleshooting, and maintaining systems.

- Security
  > Data serialization formats should be designed to be secure, with support for data encryption, digital signatures, and other security measures.

- Versioning
  > Data serialization formats should support versioning, to enable changes to be made to the data structure without breaking existing systems or data.

- Extensibility
  > Serialization formats should be designed to support extensions and evolution over time, as new data types and requirements emerge. This helps ensure that data can continue to be used and exchanged in the face of changing technology and requirements.

- Robustness
  > Serialization formats should be designed to be robust and resilient in the face of errors, edge cases, and unexpected input. This helps ensure that data can be exchanged reliably and without data loss or corruption.

## 3. Best Practice

Best practices are based on principles and are essential for ensuring the reliability, performance, and scalability of data serialization formats in a wide range of systems and applications.

- Choose the appropriate format
  > When selecting a data serialization format, it's important to choose the one that best fits the specific use case. This requires an understanding of the data structure, size, and performance requirements of the system. It's also important to consider factors such as interoperability, security, and extensibility.

- Use schema validation
  > Schema validation is a process that verifies that the data conforms to a predefined structure or schema. This can help ensure data quality and prevent errors in the system. Some data serialization formats, such as JSON and XML, support schema validation.

- Avoid unnecessary data duplication
  > Data serialization formats should be designed to minimize unnecessary data duplication. This can be achieved by using references or pointers to existing data, rather than duplicating the data itself. This can help reduce storage requirements and improve performance.

- Use efficient encoding
  > Efficient encoding is essential for minimizing memory usage and maximizing performance. Some data serialization formats, such as CBOR and MessagePack, use binary encoding, which is more efficient than text encoding.

- Consider backward and forward compatibility
  > When designing a data serialization format, it's important to consider backward and forward compatibility. Backward compatibility ensures that new versions of the data can be read by older systems, while forward compatibility ensures that older versions of the data can be read by newer systems. This requires careful attention to versioning and data structure evolution.

- Use appropriate data types
  > Data serialization formats should use appropriate data types to accurately represent the data. This includes support for numeric types, date and time types, and other specialized data types as needed.

- Use compression
  > Compression can be used to reduce the size of the serialized data, which can help improve performance and reduce storage requirements. Some data serialization formats, such as Protocol Buffers and Apache Avro, support built-in compression.

- Use encryption
  > To protect sensitive data, it's important to use encryption when transmitting data over untrusted networks. This can be done using standard encryption protocols such as SSL or TLS, or by using custom encryption schemes.

- Use versioning
  > As data serialization formats evolve over time, it's important to use versioning to ensure that older and newer systems can still communicate effectively. This can be done by including a version identifier in the serialized data, or by using a version-specific schema.

## 4. Terminology

- Serialization
  > The process of converting data from its native format into a format that can be transmitted or stored, typically in a binary or text-based format.

- Deserialization
  > The process of converting serialized data back into its original format.

- Data format
  > The specific structure and syntax used to encode and decode data, such as JSON, XML, or Protocol Buffers.

- Schema
  > A formal specification of the structure and data types used in a particular serialization format. Schemas can be used to validate input data and ensure compatibility between different systems.

- Protocol
  > A set of rules and standards governing how data is transmitted and received between different systems, often including a specific serialization format.

- Encoding
  > The process of converting data from one representation to another, such as from text to binary.

- Decoding
  > The process of converting encoded data back into its original representation.

- Wire format
  > The specific binary format used to transmit data over a network, such as the format used by HTTP or TCP/IP.

- Type mapping
  > The process of mapping data types between different programming languages or serialization formats, to ensure that data can be transmitted and decoded correctly.

- RPC (Remote Procedure Call)
  > A protocol that allows a program to call a function or method on a remote system, using a specific serialization format and communication protocol.

- Marshalling
  > The process of converting data from its native programming language into a format that can be serialized and transmitted, often using a library or API provided by the serialization format.

- Unmarshalling
  > The process of converting serialized data back into its native programming language, often using a library or API provided by the serialization format.

- Payload
  > The actual data being transmitted or stored, as opposed to any additional metadata or headers.

- Endianness
  > Refers to the order in which bytes are stored and transmitted, which can vary between different systems and architectures. Endianness can affect how data is serialized and deserialized, and must be taken into account to ensure compatibility between different systems.

- Canonicalization
  > The process of converting data into a canonical form, which can help ensure compatibility between different systems and prevent security vulnerabilities such as XML injection attacks.

- Tag or key
  > A unique identifier used to label or identify data elements within a serialized message, such as a field name in a JSON object or an element name in an XML document.

- Value
  > The actual data associated with a tag or key, which can take various forms depending on the serialization format and data type.

- Message
  > A complete serialized data structure, which may contain multiple tags or keys and their associated values.

- Pretty-printing
  > A technique used to format serialized data in a human-readable way, by adding whitespace and line breaks to separate different elements of the message. This can make it easier to debug and troubleshoot serialization issues, but can also increase message size.

- Backward compatibility
  > The ability to deserialize data from an older version of a schema or serialization format, often achieved through techniques such as versioning and data migration.

- Forward compatibility
  > The ability to deserialize data from a newer version of a schema or serialization format, often achieved through techniques such as schema evolution and data transformation.

- Metadata
  > Additional information included with a serialized message, such as timestamps, source and destination addresses, or authentication tokens.

- Streaming
  > The process of transmitting or receiving large serialized messages in a piecemeal fashion, often using a specialized streaming API or protocol. Streaming can improve performance and reduce memory usage in certain scenarios, but can also add complexity and overhead.
