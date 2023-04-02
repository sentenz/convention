# Cryptography

Cryptography is the practice of securing communication from third-party interference, where third-party is anyone who is not authorized to access the communication. Cryptography uses mathematical algorithms to convert the original message, known as plaintext, into an unreadable format called ciphertext.

The ciphertext can only be read by someone who possesses the key used to encrypt the message, and this key is kept secret by the authorized parties. Cryptography is used for various purposes, such as confidentiality, integrity, authentication, and non-repudiation.

- [1. Category](#1-category)
  - [1.1. Symmetric Cryptography](#11-symmetric-cryptography)
  - [1.2. Asymmetric Cryptography](#12-asymmetric-cryptography)
  - [1.3. Hash Functions](#13-hash-functions)
    - [1.3.1. Password Hash](#131-password-hash)
  - [1.4. Steganography](#14-steganography)
  - [1.5. Cryptanalysis](#15-cryptanalysis)
  - [1.6. Cryptographic Protocols](#16-cryptographic-protocols)
  - [1.7. Homomorphic Encryption](#17-homomorphic-encryption)
  - [1.8. Zero-Knowledge Proofs](#18-zero-knowledge-proofs)
  - [1.9. Cryptographic Tokens](#19-cryptographic-tokens)
  - [1.10. Key Management](#110-key-management)
  - [1.11. Cryptographic Hardware](#111-cryptographic-hardware)
  - [1.12. Digital Signatures](#112-digital-signatures)
  - [1.13. Key Exchange](#113-key-exchange)
  - [1.14. Public Key Infrastructure](#114-public-key-infrastructure)
  - [1.15. Random Number Generation](#115-random-number-generation)
  - [1.16. Side-Channel Attacks](#116-side-channel-attacks)
  - [1.17. Multi-Party Computation](#117-multi-party-computation)
  - [1.18. Obfuscation](#118-obfuscation)
  - [1.19. One-Time Pad](#119-one-time-pad)
  - [1.20. Perfect Forward Secrecy](#120-perfect-forward-secrecy)
  - [1.21. Blockchain Technology](#121-blockchain-technology)
  - [1.22. Quantum Cryptography](#122-quantum-cryptography)
  - [1.23. Post-Quantum Cryptography](#123-post-quantum-cryptography)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)

## 1. Category

Cryptography encompasses a wide range of techniques and protocols that are used to secure communication and data storage in various applications. Cryptography is a constantly evolving field, and new techniques and protocols are being developed to meet the ever-increasing demand for digital security and privacy.

### 1.1. Symmetric Cryptography

Symmetric cryptography, also known as secret key cryptography, uses the same key for both encryption and decryption. The key is kept secret between the sender and receiver, and the encryption process is fast and efficient. However, the main challenge is to securely share the key between the sender and receiver. Some popular symmetric encryption algorithms include `Advanced Encryption Standard (AES)`, `Data Encryption Standard (DES)`, `Triple Data Encryption Standard (3DES)`, and `Blowfish`.

### 1.2. Asymmetric Cryptography

Asymmetric cryptography, also known as public key cryptography, uses two different keys for encryption and decryption. The public key is used for encryption, and the private key is used for decryption. The private key is kept secret by the owner, while the public key can be shared publicly. Asymmetric cryptography is slower than symmetric cryptography but is more secure, as the private key is never shared. Some popular asymmetric encryption algorithms include `RSA` (named after the inventors Ron Rivest, Adi Shamir, and Leonard Adleman) and `Elliptic Curve Cryptography (ECC)`.

### 1.3. Hash Functions

Hash functions are used to generate a unique fixed-size output value, called a hash, from any input data of arbitrary size, which is usually a string of digits and letters. Hash functions are commonly used in cryptography for message authentication, digital signatures, password storage, and data integrity verification. Some popular hash functions include `Secure Hash Algorithm (SHA)` and `Message Digest (MD)`.

Commonly used hash functions include MD5, SHA-1, SHA-256, and SHA-3. However, MD5 and SHA-1 are considered insecure and should not be used for cryptographic purposes. SHA-256 and SHA-3 are currently the most widely used hash functions.

Family of hash functions:

- MD
  > An older family of hash functions developed by Ron Rivest. Includes several members, such as `MD2`, `MD4`, and `MD5`.
  >
  > NOTE Considered insecure and should not be used.

- SHA-1
  > SHA-1 is a cryptographic hash function that produces a 160-bit hash value. It was designed by the National Security Agency (NSA) and published by the National Institute of Standards and Technology (NIST) in 1995. `SHA-1` is the only members of the SHA-1 family.
  >
  > NOTE Considered insecure and should not be used.

- SHA-2
  > A family of hash functions developed by the National Security Agency (NSA). Includes several members, such as `SHA-224`, `SHA-256`, `SHA-384`, `SHA-512`, `SHA-512/224` and `SHA-512/256`. Widely used for digital signatures, message authentication, and password storage. Provides a high level of security and is considered to be resistant to attacks.

- SHA-3
  > A family of hash functions developed as an alternative to SHA-2. Includes several members, such as `SHA3-224`, `SHA3-256`, `SHA3-384`, and `SHA3-512`. Designed to be more secure and resistant to attacks than SHA-2.

- BLAKE
  > A family of hash functions designed by Jean-Philippe Aumasson and others. Includes several members, such as `BLAKE2b` and `BLAKE2s`. Known for their high performance and security.

- Keccak
  > A family of hash functions developed by Guido Bertoni, Joan Daemen, and Gilles Van Assche. Includes several members, such as `Keccak-256` and `Keccak-512`. Chosen as the winner of the NIST hash function competition and is now the basis for SHA-3.

- Whirlpool
  > A family of hash functions developed by Vincent Rijmen and Paulo Barreto. Includes `Whirlpool-0` and `Whirlpool-T`. Not widely used, but considered secure.

- Skein
  > A family of hash functions developed by Bruce Schneier, Niels Ferguson, Stefan Lucks, Doug Whiting, Mihir Bellare, Tadayoshi Kohno, and Jon Callas. Includes several members, such as `Skein-256` and `Skein-512`. Known for their high performance and security.

Features of hash functions:

- Deterministic
  >  Given the same input, a hash function always produces the same output.

- Fixed Output Size
  >  The output of a hash function is always of a fixed size, regardless of the input size.

- One-Way
  >  It should be computationally infeasible to determine the input message from the hash value.

- Collision Resistance
  >  It should be computationally infeasible to find two input messages that produce the same hash value.

- Uniformity
  >  A small change in the input message should produce a significant change in the hash value.

- Non-Reversibility
  >  It should be computationally infeasible to determine the input message from the hash value.

#### 1.3.1. Password Hash

Password hash functions are a specific type of hash function that are designed to store and verify passwords securely. Passwords are often the first line of defense in protecting user accounts and sensitive information, so it is important to store them securely.

Commonly used password hash functions include `bcrypt`, `scrypt`, `PBKDF2`, and `Argon2`. These functions are designed to be slow and computationally intensive, making them more difficult to crack through brute-force attacks. It is important to choose a strong password hash function and to use a unique salt for each user's password to ensure maximum security.

Features of password hash:

- Salted
  >  Password hash functions use a salt, which is a random value added to the password before hashing. This helps prevent attackers from using precomputed hash values, such as rainbow tables, to quickly crack passwords.

- Slow
  >  Password hash functions are intentionally slow to make brute-force attacks more difficult. This slows down attackers who try to guess passwords by hashing them repeatedly until they find a match.

- Strong
  >  Blowfish, SHA-256 or SHA-3 are commonly used for password storage, since MD5 and SHA-1 are considered insecure.

- Non-Reversible
  >  Password hash functions are non-reversible, meaning that it is computationally infeasible to determine the password from the hash value. This helps ensure that even if an attacker gains access to the password hash values, they cannot easily determine the passwords themselves.

- Unique
  >  Password hash functions generate unique hash values for each password. This helps ensure that even if two users have the same password, their hash values will be different, making it more difficult for an attacker to attack multiple accounts at once.

### 1.4. Steganography

Steganography is the practice of hiding a message within another message or image. Unlike cryptography, which only secures the message, steganography hides the message from the observer. The hidden message is often referred to as the payload. Steganography is often used in conjunction with cryptography to provide additional security.

### 1.5. Cryptanalysis

Cryptanalysis is the study of methods to break cryptographic systems. Cryptanalysts use various techniques such as mathematical analysis, brute force attacks, and side-channel attacks to break cryptographic algorithms. Cryptanalysis is an essential aspect of cryptography, as it helps to identify weaknesses in cryptographic systems and improve their security.

### 1.6. Cryptographic Protocols

Cryptographic protocols are a set of rules and procedures used to secure communication between two or more parties. Cryptographic protocols combine various cryptographic techniques, such as encryption, digital signatures, and hash functions, to provide secure communication. Some popular cryptographic protocols include `Transport Layer Security (TLS)`, `Secure Sockets Layer (SSL)`, and `Pretty Good Privacy (PGP)`.

### 1.7. Homomorphic Encryption

Homomorphic encryption is a type of encryption that allows computations to be performed on ciphertexts without decrypting them. This means that data can be processed and analyzed while still being encrypted, preserving its confidentiality. Homomorphic encryption has the potential to transform the way data is processed and analyzed, as it allows sensitive data to be analyzed without the need to expose it.

### 1.8. Zero-Knowledge Proofs

Zero-knowledge proofs are a type of protocol that allows one party to prove to another that they know a particular secret without revealing any information about that secret. Zero-knowledge proofs are used in various applications, such as authentication, identification, and access control.

### 1.9. Cryptographic Tokens

Cryptographic tokens are physical devices that store cryptographic keys and are used for authentication and access control. Cryptographic tokens are often used in two-factor authentication systems and are considered to be more secure than traditional password-based systems.

### 1.10. Key Management

Key management is the process of generating, storing, and distributing cryptographic keys used in cryptographic systems. Key management is essential for maintaining the security of cryptographic systems, as a compromised key can compromise the entire system.

Categories of key management:

- Key Generation
  >  This involves creating cryptographic keys using a secure random number generator. The keys should be of sufficient length and complexity to resist attacks.

- Key Distribution
  >  This involves securely transferring cryptographic keys from the key generator to the users who need them. This may involve using secure channels or protocols, such as Transport Layer Security (TLS), to ensure the confidentiality and integrity of the keys during transit.

- Key Storage
  >  This involves storing cryptographic keys securely to prevent unauthorized access. Keys should be stored in a tamper-proof hardware security module (HSM) or a secure software key store. The keys should be protected with strong access controls, such as multi-factor authentication.

- Key Usage
  >  This involves using cryptographic keys securely in cryptographic operations, such as encryption, decryption, and digital signatures. The keys should be used only for their intended purpose and should be protected from misuse or unauthorized access.

- Key Revocation
  >  This involves revoking cryptographic keys that are no longer needed or that may have been compromised. Keys should be revoked as soon as possible to prevent their use in future attacks. Revocation should be done securely to ensure that the revoked keys cannot be used again.

- Key Recovery
  >  This involves recovering cryptographic keys in case they are lost or damaged. This may involve using backup keys or key recovery agents to recreate the lost keys.

### 1.11. Cryptographic Hardware

Cryptographic hardware refers to specialized hardware devices designed to perform cryptographic operations. Cryptographic hardware is often used in high-security applications where software-based solutions may not provide adequate security.

### 1.12. Digital Signatures

Digital signatures are used to provide authentication, integrity, and non-repudiation to electronic documents and messages. A digital signature is generated using a private key and can be verified using the corresponding public key. Digital signatures are widely used in e-commerce, online contracts, and electronic voting systems.

### 1.13. Key Exchange

Key exchange is the process of securely sharing cryptographic keys between two or more parties. Key exchange protocols ensure that the keys are shared only between the intended parties and are not intercepted by attackers. Key exchange protocols are an essential component of many cryptographic systems, such as SSL/TLS and IPSec.

Protocols for key exchange:

- Diffie-Hellman Key Exchange
  >  This is a popular key exchange protocol that allows two parties to establish a shared secret key over an insecure communication channel.

- Elliptic Curve Diffie-Hellman (ECDH)
  >  This is a variant of the Diffie-Hellman Key Exchange that uses elliptic curves to generate the shared secret key.

- RSA Key Exchange
  >  This is a key exchange protocol based on the RSA encryption algorithm.

### 1.14. Public Key Infrastructure

Public Key Infrastructure (PKI) is a set of technologies, protocols, and services used to manage digital certificates and public-private key pairs. PKI is used to enable secure communication and authentication over a network or the internet.

PKI functions:

- Certificate authority (CA)
  >  A trusted third-party organization that issues digital certificates to verify the identity of users, devices, or services. The CA uses its private key to sign the digital certificate, which contains the public key of the certificate holder.

- Registration authority (RA)
  >  An entity that verifies the identity of the certificate holder before issuing a digital certificate on behalf of the CA.

- Certificate management
  >  The process of issuing, renewing, revoking, and managing digital certificates.

- Certificate revocation
  >  The process of invalidating a digital certificate before its expiration date, usually due to a compromise of the private key or other security concerns.

### 1.15. Random Number Generation

Random number generation is a crucial component of cryptography, used in various applications such as key generation, encryption, and digital signature schemes. A random number generator must be unpredictable and produce a statistically random sequence of numbers. A compromised or faulty random number generator can lead to vulnerabilities in cryptographic systems that can be exploited by attackers.

Types of random number generators:

- Pseudo-Random Number Generators (PRNGs)
  >  These are algorithms that generate a sequence of numbers that appear to be random but are actually generated using a deterministic process. PRNGs use a `seed` value as the starting point to generate the sequence of numbers. While PRNGs are not truly random, they are used widely in various applications, such as simulations and games, where the sequence of numbers generated only needs to be unpredictable and not truly random.

- True Random Number Generators (TRNGs)
  >  These generate a sequence of numbers that are truly random and unpredictable. TRNGs use physical sources of randomness, such as atmospheric noise, thermal noise, or radioactive decay, to generate random numbers. TRNGs are typically slower and more complex than PRNGs, but they provide a higher level of security.

### 1.16. Side-Channel Attacks

Side-channel attacks are a type of cryptanalytic attack that exploits weaknesses in the physical implementation of cryptographic systems, such as power consumption, electromagnetic radiation, or sound. Side-channel attacks can be used to extract cryptographic keys or other sensitive information from a system. Side-channel attacks are often used in combination with other cryptanalytic techniques to break cryptographic systems.

### 1.17. Multi-Party Computation

Multi-party computation is a type of secure computation that allows multiple parties to jointly compute a function on their private inputs without revealing their inputs to each other. Multi-party computation is used in various applications, such as secure auctions, collaborative data analysis, and private data sharing.

### 1.18. Obfuscation

Obfuscation is a technique used to hide the meaning of code or data without affecting its functionality. Obfuscation is often used in software protection to make it difficult for attackers to reverse engineer code or steal intellectual property.

### 1.19. One-Time Pad

The one-time pad is a cryptographic technique that uses a random key of the same length as the message to encrypt and decrypt the message. The one-time pad is theoretically unbreakable if the key is kept secret and used only once, but it is impractical for most applications due to the large size of the key.

### 1.20. Perfect Forward Secrecy

Perfect forward secrecy is a property of cryptographic systems that ensures that past communication cannot be compromised even if the secret key is compromised in the future. Perfect forward secrecy is achieved by generating a new key for each communication session, ensuring that compromise of one key does not compromise past or future communications.

### 1.21. Blockchain Technology

Blockchain technology is a distributed ledger technology that uses cryptography to secure transactions and data. Blockchain technology is used in various applications, such as cryptocurrencies, supply chain management, and digital identity management. Blockchain technology relies heavily on cryptographic techniques, such as digital signatures, hash functions, and symmetric and asymmetric encryption.

### 1.22. Quantum Cryptography

Quantum cryptography uses principles of quantum mechanics to ensure secure communication between two parties. It is based on the fact that any attempt to measure a quantum system disturbs the system, and this disturbance can be detected by the communicating parties. Quantum cryptography is still in the experimental stage and is not yet widely used.

### 1.23. Post-Quantum Cryptography

Post-quantum cryptography is a type of cryptography that is designed to be resistant against attacks from quantum computers. Quantum computers have the potential to break many of the current cryptographic algorithms, making post-quantum cryptography an area of active research. Some popular post-quantum cryptography algorithms include lattice-based cryptography and code-based cryptography.

## 2. Principle

Cryptography is based on several fundamental principles that form the basis of modern cryptographic systems.  Principles form the foundation of modern cryptographic systems and are essential for ensuring the security and privacy of our digital lives.

- Confidentiality
  > Confidentiality is the principle of keeping data or information hidden from unauthorized access. Confidentiality is achieved through encryption, which scrambles the original data so that it can only be read by those with the proper decryption key.

- Integrity
  > Integrity is the principle of ensuring that data or information is not tampered with or altered in any way during transmission or storage. Integrity is achieved through message authentication, which uses cryptographic hash functions to ensure that the message has not been altered.

- Authenticity
  > Authenticity is the principle of ensuring that the identity of the sender or recipient of a message is verified. Authenticity is achieved through digital signatures, which use public key cryptography to sign a message and verify the identity of the sender.

- Non-Repudiation
  > Non-repudiation is the principle of ensuring that the sender of a message cannot deny having sent it. Non-repudiation is achieved through digital signatures, which provide evidence of the origin of a message and the identity of the sender.

- Key Management
  > Key management is the process of generating, storing, and distributing cryptographic keys used in cryptographic systems. Key management is essential for maintaining the security of cryptographic systems, as a compromised key can compromise the entire system.

- Complexity
  > Complexity is the principle of making cryptographic algorithms difficult to break. Cryptographic algorithms should be designed in such a way that they require significant computing power and time to break, even with the most advanced technology.

- Availability
  > Availability is the principle of ensuring that the cryptographic system is available and accessible to authorized users when needed. Availability is achieved through system design, redundancy, and backup procedures.

- Kerckhoffs' Principle
  > Kerckhoffs' Principle is a fundamental principle of modern cryptography that states that a cryptographic system should be secure even if the attacker knows everything about the system, except for the secret key. This principle emphasizes the importance of strong and secure key management.

## 3. Best Practice

Best practices ensure the security of cryptographic systems and protect against potential threats and attacks.

- Use Strong and Up-to-Date Algorithms
  > Use cryptographic algorithms that are strong and up-to-date. Avoid using deprecated algorithms that are known to be vulnerable to attacks.

- Keep Cryptographic Systems Up-to-Date
  > Keep cryptographic systems up-to-date with the latest software updates, patches, and security fixes. This can help protect against known vulnerabilities and ensure that the system is secure against new and emerging threats.

- Use Strong Keys
  > Use strong and complex keys for encryption and decryption. The keys should be long enough to make brute-force attacks unfeasible.

- Use Key Management Best Practices
  > Implement key management best practices, including key generation, storage, distribution, and revocation. Keys should be generated securely and distributed only to authorized personnel.

- Implement Access Control
  > Implement access control mechanisms to restrict access to cryptographic systems to authorized personnel only. Access should be granted based on the principle of least privilege.

- Use Secure Channels for Key Exchange
  > Use secure channels for key exchange to prevent interception and man-in-the-middle attacks. Secure channels can include public key infrastructure, secure socket layer (SSL), and virtual private networks (VPN).

- Implement End-to-End Encryption
  > Implement end-to-end encryption to ensure that data is encrypted throughout the communication process, from the sender to the receiver. End-to-end encryption can prevent interception and man-in-the-middle attacks.

- Use Digital Signatures for Authentication
  > Use digital signatures to authenticate digital documents and messages. Digital signatures provide evidence of the identity of the signer and ensure that the document has not been altered.

- Protect Against Side-Channel Attacks
  > Protect against side-channel attacks, which exploit physical characteristics of the system to obtain information about the keys used in the system. Side-channel attacks can include power analysis, electromagnetic analysis, and acoustic analysis.

- Perform Regular Security Audits
  > Perform regular security audits to identify potential vulnerabilities and weaknesses in cryptographic systems. Audits can include penetration testing, vulnerability scanning, and code review.

- Document and Enforce Security Policies
  > Document and enforce security policies that specify the roles and responsibilities of personnel with access to cryptographic systems. Security policies should include procedures for key management, access control, and incident response.

- Use Random Number Generators
  > Use high-quality random number generators to generate cryptographic keys and other random values. Pseudo-random number generators can be vulnerable to predictability attacks if the underlying algorithm is weak or if the seed is predictable.

- Protect Against Key Compromise
  > Protect against key compromise by storing keys securely and minimizing the number of copies of keys in circulation. Keys should be encrypted and stored on secure hardware, such as hardware security modules (HSMs).

- Use Strong Passwords
  > Use strong passwords to protect cryptographic systems and prevent unauthorized access. Passwords should be long, complex, and unique to each user.

- Monitor System Activity
  > Monitor system activity to detect potential security breaches and anomalies. System logs can be used to track user activity, detect unauthorized access attempts, and identify potential vulnerabilities.

- Plan for Incident Response
  > Plan for incident response by developing procedures for detecting, investigating, and responding to security incidents. Incident response plans should include procedures for notifying affected parties, preserving evidence, and restoring systems to a secure state.

- Perf Perform risk assessments to identify potential threats and vulnerabilities to cryptographic systems. Risk assessments can help identify areas of weakness and guide the development of security policies and procedures.

- Use Multiple Layers of Protection
  > Use multiple layers of protection, including encryption, access control, and intrusion detection systems. By using multiple layers of protection, you can reduce the likelihood of a successful attack and mitigate the impact of a security breach.

- Follow Industry Standards and Best Practices
  > Follow industry standards and best practices for cryptographic systems. Standards bodies such as the National Institute of Standards and Technology (NIST) provide guidelines and recommendations for cryptographic algorithms and key management.

- Limit Exposure of Sensitive Information
  > Limit the exposure of sensitive information by implementing data classification and access control policies. Sensitive information should be encrypted and access should be restricted to authorized personnel only.

- Test and Verify
  > Test and verify the security of cryptographic systems through penetration testing, vulnerability scanning, and code review. Testing can help identify potential vulnerabilities and weaknesses in the system and guide the development of security policies and procedures.

- Plan for Disaster Recovery
  > Plan for disaster recovery by implementing backup and recovery procedures for cryptographic systems. Backup copies of cryptographic keys and other sensitive data should be stored in secure locations and regularly tested to ensure that they can be restored in the event of a disaster.

- Train Personnel
  > Train personnel on the proper use of cryptographic systems, including key management, access control, and incident response procedures. Personnel should also be trained on common threats and vulnerabilities, and how to detect and respond to security incidents.

- Stay Informed
  > Stay informed about new and emerging threats to cryptographic systems and keep up-to-date with the latest trends and developments in cryptography. This can help to stay ahead of potential threats and adapt security policies and procedures accordingly.

## 4. Terminology

Cryptography
  > The practice of secure communication in the presence of third parties.

- Encryption
  > The process of converting plaintext into ciphertext to make it unreadable to unauthorized parties.

- Decryption
  >  The process of converting ciphertext back into plaintext using a decryption key.

- Cryptosystem
  >  A system used for encryption and decryption of messages.

- Key
  >  A secret value used to encrypt or decrypt a message.

- Symmetric Key Cryptography
  >  A type of cryptography where the same key is used for encryption and decryption.

- Asymmetric Key Cryptography
  >  A type of cryptography where different keys are used for encryption and decryption.

- Public Key Cryptography
  >  A type of asymmetric cryptography where a public key is used for encryption and a private key is used for decryption.

- Private Key Cryptography
  >  A type of asymmetric cryptography where a private key is used for encryption and a public key is used for decryption.

- Hash Function
  >  A mathematical function that converts an input into a fixed-size output called a hash value.

- Digital Signature
  >  A cryptographic technique used to ensure the authenticity, integrity, and non-repudiation of digital messages or documents.

- Certificate
  >  A digital document that contains information about the identity of a person or organization and their public key.

- SSL/TLS
  >  Secure Sockets Layer/Transport Layer Security, a protocol used for secure communication over the internet.

- Key Exchange
  >  The process of securely exchanging keys between two parties over an insecure channel.

- Brute Force Attack
  >  A type of attack where an attacker tries all possible combinations of keys until the correct key is found.

- Man-in-the-Middle Attack
  >  An attack where an attacker intercepts communication between two parties and can eavesdrop, modify, or manipulate the messages.

- Side-Channel Attack
  >  An attack where an attacker exploits weaknesses in the physical implementation of a cryptosystem, such as measuring power consumption or electromagnetic radiation.

- Digital Certificate
  >  A digital document that contains information about the identity of a person, organization, or device, and their public key. Digital certificates are used for authentication and secure communication over the internet.

- Cryptanalysis
  >  The study of cryptographic systems with the goal of breaking them or finding weaknesses that can be exploited.

- One-time Pad
  >  A type of encryption where a random key is used only once to encrypt a message. The one-time pad is considered unbreakable if used correctly.

- Key Management
  >  The process of generating, storing, distributing, and revoking cryptographic keys.

- Message Authentication Code (MAC)
  >  A short piece of information that is used to verify the authenticity and integrity of a message.

- Nonce
  >  A random number used only once in a cryptographic protocol to prevent replay attacks.

- Salting
  >  The process of adding a random value to data before hashing it, to prevent attacks such as rainbow table attacks.

- Rainbow Tables
  >  A type of precomputed hash table used in cryptography to crack password hashes.
