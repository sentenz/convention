# Data Management

[Data Management](https://www.axiomdatascience.com/best-practices/index.html) plans help to ensure that your data are well-organized, managed, and prepared for preservation into the future. Use a data management plan to document the planned research effort, the expected outputs, and the plan for documenting and archiving data.

- [Folder Structure](#folder-structure)
  - [Project Naming Convention](#project-naming-convention)
- [File Structure](#file-structure)
  - [File Naming Convention](#file-naming-convention)
- [See also](#see-also)

## Folder Structure

- 00_Governance
  > Includes scoping documents, static documents for regular reference but minimal change.
  - 00_Contract
    > Includes Customer Contracts, Non Disclosure Agreements (NDA) and Suplier Contracts.
  - 01_Request
    > Includes Market Reports.
  - 02_Order
    > Includes Executive Summary and Project Approval.
- 01_Management
  > Includes planning and financial documents, living documents linked to regular reporting requirements and shared with internal and external stakeholders according to agreed mechanisms.
  - 00_Schedule
    > Includes Gantt Charts.
  - 01_Patent
    > Includes Customer Patent, Product Patent or Technology Patent.
  - 02_Finance
    > Includes Cost calculation or Budget.
  - 99_Sharing
    > Contains files that are shared with external parties. Here a state is frozen so that it is no longer processed after sharing.
- 02_Requirement
  > Contains all requirements of the project over the entire runtime.
  - HW
  - SW
- 03_Development
  > Includes technical documents related to deliverables, day-to-day project activities, documents generally used only by internal project teams to create a result.
  - 00_Asset
    > Contains living documents with regular changes.
  - 01_Research
    > Contains static documents like data sheets and research papers.
- 04_Communication
  > Includes internal and external information exchange.
  - Meetings
  - Reports
  - E-Mails
- 05_Result
  > Includes generated output of the project. This includes lessons learned and documents that are required for manufacturing / mass production.

### Project Naming Convention

The naming rule is: `[YYYY]_[customer]_[title]_[sequence]`.

- `YYYY`
  > Refers to the year of project launch: 2022.

- `customer`
  > Refers to the name of the customer or company: Apple.

- `title`
  > Refers to the title of the project: iPhone-13.

- `sequence`
  > Refers to the sequential number, default 1: 1.

Illustrations as follows:

- 2022_Apple_iPhone-13_1

## File Structure

A successful [file structure](https://mitcommlab.mit.edu/broad/commkit/file-structure/) organizes your data and code with the goal of repeatability, making it easier for you and your collaborators to revisit, revise and develop your project. File structures are not fixed entities, but rather build a framework that communicates the function and purpose of elements within a project by separating concerns into a hierarchy of folders and using consistent, chronological, and descriptive names.

### File Naming Convention

The naming rule is: `[YYYYMMDD]_[type]_[scope]_[author]_[title]_[subtitle]_[version]`.

- `YYYYMMDD`
  > Refers to the creation date according to the ISO 8601 date format: 20220401.

- `type`
  > Refers to the document abbreviation or a document no.: mm or 1234.
  >
  > - mm (meeting minute)

- `scope`
  > Refers to the scope of the document: internal.
  >
  > - internal
  > - cu (customer)
  > - su (supplier)

- `author`
  > Refers to the name, department, category of the document author: s.
  >
  > - s (sentenz)

- `title`
  > Refers to the title of the project: iphone-13.

- `subtitle`
  > Refers to the subtitle of the project: mini.

- `version`
  > Refers to the version of the document, default v01: v01.

Illustrations as follows:

- 20220401_mm_internal_s_apple_iphone-13_mini_v01

## See also

- Axiom [data management](https://www.axiomdatascience.com/best-practices/index.html) article.
- Broad [file structure](https://mitcommlab.mit.edu/broad/commkit/file-structure/) article.
