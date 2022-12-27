# Web Page

A Web Page (Page) is a hypertext document on the World Wide Web that is identified by a unique uniform resource locator (URL). Pages are delivered by a web server to the user and displayed in a web browser (client). A website consists of pages linked together under a common domain name.

- [1. Dynamic Site](#1-dynamic-site)
- [2. Static Site](#2-static-site)
  - [2.1. Static Site Generators](#21-static-site-generators)
    - [2.1.1. Next.js](#211-nextjs)
    - [2.1.2. Hugo](#212-hugo)
    - [2.1.3. Gatsby](#213-gatsby)
    - [2.1.4. Jekyll](#214-jekyll)
    - [2.1.5. Nuxt.js](#215-nuxtjs)
    - [2.1.6. Docusaurus](#216-docusaurus)
  - [2.2. Headless CMS](#22-headless-cms)
    - [2.2.1. Strapi](#221-strapi)
    - [2.2.2. Ghost](#222-ghost)
    - [2.2.3. Directus](#223-directus)
    - [2.2.4. WordPress](#224-wordpress)
  - [2.3. Hosting and Deployment](#23-hosting-and-deployment)
    - [2.3.1. Netlify](#231-netlify)
    - [2.3.2. Vercel](#232-vercel)
    - [2.3.3. GitHub Pages](#233-github-pages)
    - [2.3.4. Microsoft Azure](#234-microsoft-azure)
    - [2.3.5. Firebase](#235-firebase)
- [3. References](#3-references)

## 1. Dynamic Site

A Dynamic Website (also referred to as a database-driven site) requires web programming and database design. A dynamic website contains information and content that changes, depending on the viewer of the site, the time of the day, the time zone, or the native language of the country the viewer. The content of the site (text/images) is stored on a database or content management system (CMS). When the information is updated or changed within the database, it changes on the site.

## 2. Static Site

A Static Website is displayed in a web browser exactly as it is stored. It contains web pages with fixed content coded in HTML and stored on a web server. It does not change, it stays static for every viewer of the site.

A Static site is essentially composed of three components: the structure (HTML), the layout and styles (CSS), and the behavior (JavaScript). They use server-side rendering to serve HTML, CSS, and Javascript files.

[Jamstack](https://github.com/jamstack/jamstack.org) is an architectural approach that decouples the web experience layer from data and business logic, improving flexibility, scalability, performance, and maintainability.

Jamstack removes the need for business logic to dictate the web experience.

It enables a composable architecture for the web where custom logic and 3rd party services are consumed through APIs.

A modern web development architecture based on client-side JavaScript, reusable APIs, and prebuilt Markup.

- JavaScript
  > The scripting language can be used to keep websites dynamic. This allows images to be reloaded or user input to be evaluated.

- APIs
  > Server side operations are abstracted into reusable APIs. Interfaces can be used to exchange content with different frontends. Usually, a REST API with JavaScript is used for this purpose, which is based on commands for different third party applications.

- Markup
  > The HTML markup language is the cornerstone of the Web. The language is standardized that practically every application can handle it. These can be generated from source files, such as Markdown, using a Static Site Generator.

### 2.1. Static Site Generators

A static site generator (SSG) is a software application that creates HTML pages from templates or components and a given content source. Most static site generators, accept Markdown formatted text files as a source.

A List of [Static Site Generators](https://jamstack.org/generators/).

#### 2.1.1. Next.js

[Next.js](https://github.com/vercel/next.js) is a minimalistic framework for server-rendered React applications as well as statically exported React apps.

#### 2.1.2. Hugo

[Hugo](https://github.com/gohugoio/hugo) is a static site generator written in Go. Hugo is optimized for speed, usability and configurability. Hugo takes a directory with content and templates and renders them into a full html website.

Hugo makes use of Markdown files with front matter for meta data.

A typical website of moderate size can be rendered in a fraction of a second. A good rule of thumb is that Hugo takes around 1 millisecond for each piece of content.

Hugo is written to work well with any kind of website including blogs, tumbles and docs.

#### 2.1.3. Gatsby

[Gatsby](https://github.com/gatsbyjs/gatsby) is a free and open source framework based on React that helps developers build fast websites and apps.

It combines the control and scalability of dynamically rendered sites with the speed of static-site generation.

#### 2.1.4. Jekyll

[Jekyll](https://github.com/jekyll/jekyll) is a plain, blog-aware, static site generator perfect for personal, project, or organization sites. Think of it like a file-based CMS, without all the complexity. Jekyll takes the content, renders Markdown and Liquid templates, and creates a complete, static website ready to be served by Apache, Nginx or another web server.

#### 2.1.5. Nuxt.js

[Nuxt](https://github.com/nuxt/nuxt.js) export Vue.js Web Application into a static website.

Vue SSR is used to generate static and dynamic pages for both client and server by so called Isomorphic/Universal rendering.

Nuxt generates static website, deployed into a `./dist` folder and it runs from everywhere: Netlify, GitHub Pages, GitLab Pages, or AWS3.

#### 2.1.6. Docusaurus

[Docusaurus](https://github.com/facebook/docusaurus) is a project for building, deploying, and maintaining open source project websites.

Docusaurus support pre-configured translations via [crowdin](https://github.com/crowdin), document versioning in sync with project releases, and documentation search via [algolia](https://github.com/algolia).

### 2.2. Headless CMS

[Headless CMS](https://www.ionos.com/digitalguide/hosting/cms/headless-cms-vs-traditional-cms) have no fixed frontend and consists of a backend only.

With a headless CMS, the content is also stored in a database. However, the content is not only made available to a specific website. A wide variety of frontends can access the data via interfaces. This is possible because modern CMSs follow the Jamstack principle.

These highly standardized technologies enable information to be passed on to a wide variety of frontends. While conventional CMS usually make restrictive specifications when writing content in order to standardize publishing, this is not the case with headless CMS. The design of the content in headless CMS has no restrictions.

A List of [Headless Content Management Systems (CMS)](https://jamstack.org/headless-cms/)

#### 2.2.1. Strapi

[Strapi](https://github.com/strapi/strapi) is a open-source headless CMS. It’s 100% JavaScript and fully customizable.

#### 2.2.2. Ghost

[Ghost](https://github.com/TryGhost/Ghost) is an open source, professional publishing platform built on a modern Node.js technology stack. Designed for teams with need for power, flexibility and performance.

#### 2.2.3. Directus

[Directus](https://github.com/directus/directus) is an open-source software provides an instant API wrapper for SQL databases and an intuitive Admin App for non-technical users to manage content.

#### 2.2.4. WordPress

[WordPress](https://github.com/WordPress/WordPress) CMS gives site developers a method for server-side rendering (SSR) using themes based on PHP templates. The platform offers a robust and extendable REST API that allows developers to create headless sites and apps using any manner of frontend technologies.

### 2.3. Hosting and Deployment

The code deployment on static website hosting is a straightforward process but still an essential part of the static website build phase. During this stage, external data is pulled into the website, and pages are prepared to be published on the internet.

A list of [static website hosting providers](https://www.staticwebsitehosting.org/).

#### 2.3.1. Netlify

[Netlify](https://www.netlify.com) is a web developer platform that multiplies productivity.

By unifying the elements of Jamstack the modern decoupled web, from local development to advanced edge logic, Netlify enables a faster path to more performant, secure, and scalable websites and apps.

Automatic deployment with the platform from website source code on GitHub, GitLab, or BitBucket by continuous deployment. Alternative, deploy the website manually using the Netlify CLI.

#### 2.3.2. Vercel

[Vercel](https://vercel.com/) is a static website hosting provider.

Vercel directly perform GitHub, GitLab, or BitBucket account deployment. Each time code changes into the production branch merfed, the build will be triggered automatically, and a new version of the website will be published.

#### 2.3.3. GitHub Pages

[GitHub Pages](https://pages.github.com/) is provided directly from the GitHub repository. The platform’s deployment is possible by creating the repository and pushing changes to the main branch. The site is built each time there are new changes in the main branch.

- Custom URL
  > Create a file named CNAME and include the URL.

- Themes
  > Using Jekyll for generating websites, themes can be select from the repository settings.

#### 2.3.4. Microsoft Azure

[Microsoft Azure Static Web Apps](https://azure.microsoft.com/en-us/services/app-service/static/) is a hosting service for web apps on its globally distributed content network by tapping right into the CI/CD workflows to get the website from code to the cloud.

Due to its complex integration with other solutions hosted on Microsoft Azure, such as Azure Functions, Azure SQL and others, it is tailored for more complex web applications, but can also be used for hosting static websites.

#### 2.3.5. Firebase

[Firebase](https://firebase.google.com/) is backed by Google and offers online services for web and mobile app programmers and game developers. Included are monitoring solutions, databases, authentication, and serve static and dynamic content to a global CDN (content delivery network).

## 3. References

- Sentenz [about docs as code](../about/docs-as-code.md) article.
- GitLab [comparing static site generator](https://about.gitlab.com/blog/2022/04/18/comparing-static-site-generators/) article.
- GitLab [dynamic vs static pages](https://about.gitlab.com/blog/2016/06/03/ssg-overview-gitlab-pages-part-1-dynamic-x-static/) article
- GitLab [ssg pages](https://gitlab.com/pages) examples.
