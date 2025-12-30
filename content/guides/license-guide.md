# License Guide

The licenses are classified according to the [Google License Classification](https://opensource.google/documentation/reference/thirdparty/licenses). For a deeper understanding, please refer to the link.

- [1. Classification](#1-classification)
- [2. License](#2-license)
  - [2.1. External Use](#21-external-use)
  - [2.2. Internal Use](#22-internal-use)
- [3. Tools](#3-tools)
- [4. References](#4-references)

## 1. Classification

Information on to comply with open source licenses for externally distributed software, what these licenses are, what categories they fall under, and how to handle them.

- [Restricted](https://opensource.google/documentation/reference/thirdparty/licenses#restricted) licenses
  > The `restricted` licenses. Licenses in this category require mandatory source distribution (including product source code) if a company ships a product that includes third-party code protected by such a license. Also, any use of source code under licenses of this type in a product will **taint** product source code with the restricted license. Third-party software made available under one of these licenses must not be part of company products that are delivered to outside customers. Such prohibited distribution methods include `client` (downloadable client software) and `embedded`.

- [Reciprocal](https://opensource.google/documentation/reference/thirdparty/licenses#reciprocal) licenses
  > The `reciprocal` licenses apply the same permissions and limitations set by the Restricted category of licenses, but with one important exception. The obligation to make source code available to recipients of software that depends on a Reciprocally licensed library only extends to the contents of the library itself, together with any additions to or modifications of that individual library. Unlike GPL and other Restricted licenses, the other components of the software depending on the Reciprocal library do not need to have their source released under the corresponding reciprocal license.
  >
  > The distribution of software that contains reciprocally licensed components triggers our obligation to make the corresponding source code of those components available to end users. Reciprocally licensed third-party source code must be made available by mirroring it to a repository. However, if there are compelling reasons not to mirror the internal modifications externally or share them upstream, then the reciprocally licensed package must not be used in software that is distributed outside of company.

- [Notice](https://opensource.google/documentation/reference/thirdparty/licenses#notice) licenses
  > The `notice` licenses contain few restrictions, allowing original or modified third-party software to be shipped in any product without endangering or encumbering product source code. All of the licenses in this category do, however, have an "original Copyright notice" or "advertising clause", wherein any external distributions must include the notice or clause specified in the license.
  >
  > For downloaded `client` products, the necessary notice files can be installed in a subdirectory of the product. For `embedded` products, that make use of `notice` licensed source code, the required notices must either be linked on an "about" page or possibly included in printed documentation. If the software at issue is a binary that is being sent to end-users devices, that users only interact with through a command line interface, then we would recommend setting up a flag that can be passed through the tool to make the console read out these notices (e.g. --notices). Alternatively, these notices can be concatenated into a THIRD_PARTY_NOTICES.txt file that is bundled with the software, as long as the software is being sent to a device that permits the end user to view the text of that file.

- [Permissive](https://opensource.google/documentation/reference/thirdparty/licenses#permissive) license
  > The `permissive` license type can be used in (relatively rare) cases where third-party software is under a license (not "Public Domain" or "free for any use" like `unencumbered`) that is even more lenient than a `notice` license. Use the `permissive` license type when even a copyright notice is not required for license compliance. For example, this license type can be used when a third-party `cc_library()` rule only adds header files (licensed under, say, the GNU LGPL) to the include path for compilation, but no actual binary libraries or source files. (Yes, these cases exist, such as with header files that define interfaces to dynamically loaded libraries that are present in the operating system distribution itself.)

- [Unencumbered](https://opensource.google/documentation/reference/thirdparty/licenses#unencumbered) licenses
  > In addition to the Public Domain and Authored code cases, actual licenses exist that generally declare that the code is "free for any use".
  >
  > `Public domain and "Free For Any Use"`
  >
  > NOTE Apply this label with caution. Public domain is a complex topic that requires legal analysis on a case by case basis.
  >
  > The 'unencumbered' licenses include those often referred to as "Public Domain" or "free for any use." These licenses have even fewer restrictions than licenses in the 'notice' category, but this licence type should be assigned to a third-party build rule with caution, because:
  >
  > - It is non-trivial [to place software in the public domain](https://en.wikipedia.org/wiki/Public_domain_in_the_United_States#Computer_Software_Rental_Amendments_Act). While an explicit disclaimer of copyright protection is required, that is [not necessarily sufficient](http://www.bitlaw.com/source/37cfr/201_26.html).
  > - While [works of the U.S. Government](http://en.wikipedia.org/wiki/Work_of_the_United_States_Government) are placed in the public domain, works created by contractors under government contracts may not be.
  >
  > Third-party software whose copyright notice explicitly states that the work has been placed in the "public domain" by the author or is "free for any use" will be assigned the 'unencumbered' license type. As discussed in the links above, this does not necessarily mean that the work is unprotected by copyright, but granting of a lenient license by the author can most likely be assumed.
  >
  > `Company-Authored code`
  >
  > Another instance where the 'unencumbered' license type is appropriate is company-authored code in a third-party package (such as tests added by company) that a company has not open sourced but that exists in the //third_party package with the third-party code. This is typically handled by the licenses= build directive parameter for the specific build rules in the //third_party package that are building the company-authored code (while the rest of the package has its license type set by the file-scoped licenses() directive).
  >
  > As noted at [go/thirdparty/documentation#google-owned-code](https://opensource.google/documentation/reference/thirdparty/documentation#google-owned-code), The LICENSE file for company-authored, not-yet-released code should only contain the following text: "company owned, no external contributions."

## 2. License

Classification of licenses and assignment of severity levels.

| Classification | Severity |
| -------------- | -------- |
| Forbidden      | CRITICAL |
| Restricted     | HIGH     |
| Reciprocal     | MEDIUM   |
| Notice         | LOW      |
| Permissive     | LOW      |
| Unencumbered   | LOW      |
| Unknown        | UNKNOWN  |

Classification of known licenses based on Google [License Classifier](https://github.com/google/licenseclassifier/blob/main/license_type.go).

### 2.1. External Use

Forbidden:

- AGPL-1.0
- AGPL-3.0
- CC-BY-NC-1.0
- CC-BY-NC-2.0
- CC-BY-NC-2.5
- CC-BY-NC-3.0
- CC-BY-NC-4.0
- CC-BY-NC-ND-1.0
- CC-BY-NC-ND-2.0
- CC-BY-NC-ND-2.5
- CC-BY-NC-ND-3.0
- CC-BY-NC-ND-4.0
- CC-BY-NC-SA-1.0
- CC-BY-NC-SA-2.0
- CC-BY-NC-SA-2.5
- CC-BY-NC-SA-3.0
- CC-BY-NC-SA-4.0
- Commons-Clause
- Facebook-2-Clause
- Facebook-3-Clause
- Facebook-Examples
- WTFPL

Restricted:

- BCL
- CC-BY-ND-1.0
- CC-BY-ND-2.0
- CC-BY-ND-2.5
- CC-BY-ND-3.0
- CC-BY-ND-4.0
- CC-BY-SA-1.0
- CC-BY-SA-2.0
- CC-BY-SA-2.5
- CC-BY-SA-3.0
- CC-BY-SA-4.0
- CERN 2
- GPL-1.0
- GPL-2.0
- GPL-2.0-with-autoconf-exception
- GPL-2.0-with-bison-exception
- GPL-2.0-with-classpath-exception
- GPL-2.0-with-font-exception
- GPL-2.0-with-GCC-exception
- GPL-3.0
- GPL-3.0-with-autoconf-exception
- GPL-3.0-with-GCC-exception
- LGPL-2.0
- LGPL-2.1
- LGPL-3.0
- NPL-1.0
- NPL-1.1
- OSL-1.0
- OSL-1.1
- OSL-2.0
- OSL-2.1
- OSL-3.0
- QPL-1.0
- Sleepycat

> NOTE `LGPL linking requirements`
>
> Though marked as restricted, LGPL licensed components can be used without observing of the restricted type requirements if the component is dynamically linked.
>
> If distributing software outside of the company that incorporates any LGPL licensed libraries, there are ways of meeting the license obligations that are less restrictive than the GPL's obligations if certain requirements are observed. The following steps are required in order to be able to take advantage of the reduced requirements:
>
> - The LGPL licensed library must be used as a shared library (dynamically linked).
> - For LGPL v3 only, the user must be able to replace the shared library with a compatible library and have it work (the user must be able to swap out libraries on the device).
> - Customers must receive either object files or source code (including any modifications) of the LGPL licensed library.
>
> NOTE YOU are NOT required to provide support for the LGPL licensed library. YOU are NOT required to work around bugs or problems in compatible libraries, or perform tech support for customer modifications. YOU are required to make library replacement possible (for LGPL v3). YOU are required to permit user modification of the software, and to not prohibit user modification in the terms of service.
>
> These requirements only apply to products shipped to end users. Software that is run internally (even if displayed on the web to the user) does not have to meet these requirements.

Reciprocal:

- APSL-1.0
- APSL-1.1
- APSL-1.2
- APSL-2.0
- CDDL-1.0
- CDDL-1.1
- CPL-1.0
- EPL-1.0
- EPL-2.0
- FreeImage
- IPL-1.0
- MPL-1.0
- MPL-1.1
- MPL-2.0
- Ruby

Notice:

- AFL-1.1
- AFL-1.2
- AFL-2.0
- AFL-2.1
- AFL-3.0
- Apache-1.0
- Apache-1.1
- Apache-2.0
- Artistic-1.0-cl8
- Artistic-1.0-Perl
- Artistic-1.0
- Artistic-2.0
- BSL-1.0
- BSD-2-Clause-FreeBSD
- BSD-2-Clause-NetBSD
- BSD-2-Clause
- BSD-3-Clause-Attribution
- BSD-3-Clause-Clear
- BSD-3-Clause-LBNL
- BSD-3-Clause
- BSD-4-Clause
- BSD-4-Clause-UC
- BSD-Protection
- CC-BY-1.0
- CC-BY-2.0
- CC-BY-2.5
- CC-BY-3.0
- CC-BY-4.0
- FTL
- ISC
- ImageMagick
- Libpng
- Lil-1.0
- Linux-OpenIB
- LPL-1.02
- LPL-1.0
- MS-PL
- MIT
- NCSA
- OpenSSL
- PHP-3.01
- PHP-3.0
- PIL
- Python-2.0
- Python-2.0-complete
- PostgreSQL
- SGI-B-1.0
- SGI-B-1.1
- SGI-B-2.0
- Unicode-DFS-2015
- Unicode-DFS-2016
- Unicode-TOU
- UPL-1.0
- W3C-19980720
- W3C-20150513
- W3C
- X11
- Xnet
- Zend-2.0
- zlib-acknowledgement
- Zlib
- ZPL-1.1
- ZPL-2.0
- ZPL-2.1

Permissive:

Unencumbered:

- CC0-1.0
- Unlicense
- 0BSD

### 2.2. Internal Use

Restricted:

- CERN 1.1
- OFL-1.1
- OpenVision

> NOTE [SIL Open Font License (OFL-1.1)](http://opensource.org/licenses/OFL-1.1) is not a `notice` license and has additional restrictions. Please mark packages that use the OFL-1.1 license as `by_exception_only`.

Notice:

- Beerware
- LaTeX License

## 3. Tools

- [Trivy License Scanner](https://aquasecurity.github.io/trivy/v0.35/docs/licenses/scanning/)
  > Trivy scans any container image for license files and offers an opinionated view on the risk associated with the license. License are classified using the `Google License Classification`. In addition to package licenses, Trivy scans source code files, Markdown documents, text files and `LICENSE` documents to identify license usage within the image or filesystem.

Scan license in container image and filesystem.

Standard scanning, specify an image name with `--security-checks` license.

```bash
trivy image --security-checks license --severity UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL alpine:3.15
```

Full scanning, specify an image name with `--license-full`.

```bash
trivy image --security-checks license --severity UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL --license-full grafana/grafana
```

Full scanning, specify a file system (fs) `--license-full`.

```bash
trivy fs --format json --security-checks license --severity UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL --license-full eddyData/ -o license.log
```

## 4. References

- Sentenz [SPDX convention](../convention/spdx.md) article.
- Sentenz [about licenses](../articles/licenses.md) article.
