# Static Site Generators (SSG)

Static Site Generators (SSG) are tools used to create static websites by generating HTML, CSS, and JavaScript files during a build process.

- [1. Category](#1-category)
  - [1.1. MkDocs](#11-mkdocs)
    - [1.1.1. Hoster](#111-hoster)
      - [1.1.1.1. GitLab](#1111-gitlab)
      - [1.1.1.2. GitHub](#1112-github)
- [2. Terminology](#2-terminology)
- [3. References](#3-references)

## 1. Category

### 1.1. MkDocs

MkDocs is a fast, simple, and beautiful static site generator geared towards building project documentation. It uses Markdown for documentation source files and a single YAML configuration file for setup. MkDocs comes with a selection of themes and allows for extensive customization. It includes a built-in dev server that auto-reloads to show changes in real-time. MkDocs generated sites are completely static and can be hosted on static web hosting services such as GitHub Pages or Amazon S3.

#### 1.1.1. Hoster

##### 1.1.1.1. GitLab

1. Files and Folders

    - Project Layout
      > Directory structure of a Pages project. The `/docs` directory contains all markdown files that will be converted into HTML pages.

      ```markdown
      ├── /docs
      │   ├── /adr
      │   │   ├── merging-strategy-adr.md
      │   │   └── branching-strategy-adr.md
      │   ├── api.md
      │   └── README.md
      ```

    - `mkdocs.yml`
      > The `mkdocs.yml` file is the configuration file for MkDocs.
      >
      > NOTE The defauft value for `site_dir` is `site` and for `docs_dir` is `docs`, modify the values as needed.

      ```yaml
      site_name: <Project>
      site_description: <Description of Project.>
      repo_url: <repository>
      repo_name: GitLab
      docs_dir: docs
      site_dir: public

      nav:
        - Home: README.md
        - ADR:
          - Merging Strategy: adr/merging-strategy-adr.md
          - Branching Strategy: adr/branching-strategy-adr.md
        - API: api.md
      ```

    - `./gitlab/pages.yml`
      > Configure GitLab CI by creating a `.gitlab/pages.yml` file to set up CI/CD pipelines for automatic deployment.
      >
      > NOTE GitLab Pages uses the `/public` directory to serve the static site. GitLab CI will automatically build and deploy the site to GitLab Pages.

      ```yaml
      ---
      spec:
        inputs:
          stage:
            default: pages
          job:
            default: pages
          image:
            default: python:latest
          tags:
            default: devops
          artifacts:
            default: "public"
          script:
            default: |
              pip install mkdocs mkdocs-material mkdocs-macros-plugin pymdown-extensions
              mkdocs build
      ---
      "$[[ inputs.job ]]":
        stage: $[[ inputs.stage ]]
        image: $[[ inputs.image ]]
        rules:
          - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
        tags:
          - $[[ inputs.tags ]]
        script: $[[ inputs.script ]]
        artifacts:
          name: "$CI_JOB_NAME"
          paths:
            - $[[ inputs.artifacts ]]
      ```

    - `.gitlab-ci.yml`
      > Modify the GitLab CI file in the root of the `/project` directory to configure the CI/CD pipeline for automatic deployment.

      ```yaml
      ---
      include:
       - local: ".gitlab/pages.yml"
         inputs:
           stage: deploy
      ```

2. Command and Operations

    - Install
      > Installs MkDocs on the GitLab CI runner along with a set of extensions and themes, such as Material for MkDocs, which provides a material design theme, and various plugins and extensions to enhance the documentation.

      ```bash
      pip install mkdocs mkdocs-material mkdocs-macros-plugin pymdown-extensions
      ```

    - Setup
      > Initializes a new MkDocs project in the current directory. It creates a default `mkdocs.yml` configuration file and a `/docs` directory for documentation source files.

      ```bash
      mkdocs new .
      ```

    - Build
      > Builds the MkDocs site by converting the markdown files in the `/docs` directory into HTML pages and assets in the `site_dir` directory.
      >
      > NOTE GitLab Pages uses the `/public` directory to serve the static site. MkDocs will automatically build and deploy sites located in `/public` to GitLab Pages.

      ```bash
      mkdocs build
      ```

##### 1.1.1.2. GitHub

1. Files and Folders

    - Project Layout
      > Directory structure of a Pages project. The `/docs` directory contains all markdown files that will be converted into HTML pages.

      ```markdown
      ├── /docs
      │   ├── /adr
      │   │   ├── merging-strategy-adr.md
      │   │   └── branching-strategy-adr.md
      │   ├── api.md
      │   └── README.md
      ```

    - `mkdocs.yml`
      > The `mkdocs.yml` file is the configuration file for MkDocs.
      >
      > NOTE The defauft value for `site_dir` is `site` and for `docs_dir` is `docs`, modify the values as needed.

      ```yaml
      site_name: <Project>
      site_url: https://<repository>.github.io/<project>/
      site_author: <Author>
      site_description: <Description of Project.>
      repo_url: https://github.com/<repository>/<project>/
      repo_name: GitHub
      edit_uri: blob/main/docs/
      docs_dir: docs
      site_dir: public

      nav:
        - Home: README.md
        - ADR:
          - Merging Strategy: adr/merging-strategy-adr.md
          - Branching Strategy: adr/branching-strategy-adr.md
        - API: api.md
      ```

    - `.github/workflows/pages.yml`
      > Create a `.github/workflows/pages.yml` file to set up GitHub Actions for automatic deployment. Ensure that the `actions/upload-pages-artifact` point to the `site_dir` directory from the `mkdocs.yml` configuration file.
      >
      > NOTE Enable GitHub Pages under the repository settings and select the `gh-pages` branch as the source. GitHub Actions will automatically build and deploy the site to the `gh-pages` branch.

      ```yaml
      ---
      name: Pages
      on:
        push:
          branches:
            - main
      permissions:
        contents: write
        id-token: write
        pages: write
      jobs:
        pages:
          runs-on: ubuntu-latest
          steps:
            - uses: actions/checkout@v4
            - uses: actions/setup-python@v5
              with:
                python-version: 3.x
            - name: Workflow
              run: |
              pip install mkdocs mkdocs-material mkdocs-macros-plugin pymdown-extensions
              mkdocs build
            - name: Upload
              uses: actions/upload-pages-artifact@v3
              with:
                path: public
            - name: Deploy
              uses: actions/deploy-pages@v4
      ```

2. Command and Operations

    - Install
      > Installs MkDocs on the GitHub Actions along with a set of extensions and themes, such as Material for MkDocs, which provides a material design theme, and various plugins and extensions to enhance the documentation.

      ```bash
      pip install mkdocs mkdocs-material mkdocs-macros-plugin pymdown-extensions
      ```

    - Setup
      > Initializes a new MkDocs project in the current directory. It creates a default `mkdocs.yml` configuration file and a `/docs` directory for documentation source files.

      ```bash
      mkdocs new .
      ```

    - Build
      > Builds the MkDocs site by converting the markdown files in the `/docs` directory into HTML pages and assets in the `site_dir` directory.
      >
      > NOTE GitLab Pages uses the `/public` directory to serve the static site. MkDocs will automatically build and deploy sites located in `/public` to GitLab Pages.

      ```bash
      mkdocs build
      ```

## 2. Terminology

- Template
  > A Template is a file that defines the layout and structure of a website or web application. Templates typically use a markup language, such as HTML or Markdown, and may include variables and logic for generating dynamic content.

- Static Site
  > A Static Site is a website that consists of pre-built HTML, CSS, and JavaScript files that are served directly from a web server, without the need for server-side processing or database queries.

- Content Management System (CMS)
  > A CMS is a software application that allows users to create, manage, and publish digital content, such as blog posts or product descriptions. In the context of SSG, a headless CMS can be used to manage content separately from the website's layout and design.

- Front-End Framework
  > A Front-End Framework is a collection of pre-built HTML, CSS, and JavaScript components and tools that can be used to create responsive and dynamic web interfaces. Popular front-end frameworks include React, Vue.js, and Angular.

- Plugin
  > A Plugin is a piece of software that can be added to an SSG to extend its functionality. Plugins can be used to add new features, optimize site performance, or automate tasks.

- Deployment
  > Deployment refers to the process of uploading a website or web application to a web server or hosting platform so that it can be accessed by users. Deploying a static site typically involves uploading pre-built HTML, CSS, and JavaScript files to a web server or CDN.

- Front Matter
  > Front Matter is metadata that is stored at the beginning of a Markdown file or other content file in an SSG. Front matter can include variables such as the title, author, or date of a blog post, which can be used to generate dynamic content.

- Server-Side Rendering (SSR)
  > Server-Side Rendering (SSR) is a process used in some web frameworks and platforms that generates HTML on the server before sending it to the client's browser. SSR can be used to improve site performance and SEO, but is not typically used in SSG.

- Content Delivery Network (CDN)
  > A Content Delivery Network (CDN) is a network of servers located around the world that can be used to distribute content, such as images, CSS files, and JavaScript files, to users more quickly and efficiently. Using a CDN can improve site performance and reduce server load.

- Minification
  > Minification is the process of removing unnecessary characters, such as whitespace and comments, from HTML, CSS, and JavaScript files. Minification can reduce file size and improve site performance.

- Build Process
  > The Build Process refers to the process of generating static files from source code and content using an SSG. The build process typically involves compiling templates, generating pages and assets, and optimizing files for performance.

- Incremental Build
  > Incremental Build is a feature available in some SSG that allows for faster site rebuilds by only updating files that have changed since the last build, instead of rebuilding the entire site.

## 3. References

- Jamstack [architecture](https://jamstack.org/) page.
