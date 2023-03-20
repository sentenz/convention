# Static Site Generators

Static site generators (SSGs) are tools that generate static HTML, CSS, and JavaScript files from templates and content files.

- [1. Category](#1-category)
  - [1.1. SSG Types](#11-ssg-types)
    - [1.1.1. File-based SSGs](#111-file-based-ssgs)
    - [1.1.2. Database-driven SSGs](#112-database-driven-ssgs)
    - [1.1.3. Hybrid SSGs](#113-hybrid-ssgs)
    - [1.1.4. Headless CMS-based SSGs](#114-headless-cms-based-ssgs)
  - [1.2. Hosting Services](#12-hosting-services)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
  - [3.1. SSG](#31-ssg)
  - [3.2. Deployment](#32-deployment)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

### 1.1. SSG Types

#### 1.1.1. File-based SSGs

File-based SSGs are static site generators that use text files as the source of content and generate HTML files by processing these files using templates. The text files typically contain metadata and content written in a markup language like Markdown. The SSG processes the text files, applies the appropriate templates, and generates the static HTML files.

File-based SSGs are suitable for small websites and blogs, where content is relatively simple and straightforward. They are easy to use, have a low learning curve, and are generally faster and more efficient than CMS-based solutions.

File-based SSGs tools:

- Jekyll
  > A simple, blog-aware, static site generator that converts Markdown and other formats into HTML and is widely used for GitHub Pages sites.

- Hugo
  > A fast and modern static site generator written in Go and can handle large websites with ease.

- Hexo
  > A fast and simple static site generator that supports plugins and themes, and is often used for blogs.

#### 1.1.2. Database-driven SSGs

Database-driven SSGs are static site generators that use a database to store content and generate HTML files by querying the database and processing the results using templates. These SSGs can handle large websites with complex content structures and are suitable for websites that require dynamic content.

Database-driven SSGs offer several advantages over file-based SSGs, such as the ability to store complex data structures, handle large amounts of data, and support dynamic content. They can also provide faster build times and easier content management.

Database-driven SSGs tools:

- Gatsby
  > A React-based static site generator that uses GraphQL to query data from various sources, such as Markdown, JSON, and APIs, and supports Progressive Web App (PWA) development.

- Next.js
  > A popular React framework that can be used as a static site generator, and supports server-side rendering, dynamic routing, and API routes.

#### 1.1.3. Hybrid SSGs

Hybrid SSGs are static site generators that combine features of file-based and database-driven SSGs. They use a database to store content and metadata, but also allow for custom templates and static files. These SSGs are suitable for websites that require more flexibility than a file-based SSG can provide, but don't need the full complexity of a database-driven SSG.

Hybrid SSGs offer the benefits of both file-based and database-driven SSGs, such as simplicity, flexibility, and speed.

Hybrid SSGs tools:

- Eleventy
  > A simple and flexible SSG that supports multiple templating languages and data sources, and can be used with or without a CMS.

- Middleman
  > A Ruby-based SSG that supports a variety of data sources, templating languages, and asset management.

#### 1.1.4. Headless CMS-based SSGs

Headless CMS-based SSGs are static site generators that use a headless CMS to manage content and generate static HTML files. A headless CMS is a content management system that provides an API to retrieve content, but doesn't provide any front-end or presentation layer. The SSG retrieves the content via the API, processes it using templates, and generates the static HTML files.

Headless CMS-based SSGs offer several advantages, such as the ability to manage content more easily, support multiple channels, and provide a more robust content management system.

Headless CMS-based SSGs tools:

- Contentful
  > A popular headless CMS that provides a content API and webhooks, and can be integrated with various front-end technologies.

- Sanity
  > A flexible headless CMS that allows developers to define content models using a schema, and provides a real-time collaborative environment for content editors.

- Strapi
  > A self-hosted headless CMS that provides an admin panel to manage content, and can be used with various front-end technologies.

### 1.2. Hosting Services

Static Site Generators (SSGs) generate static HTML, CSS, and JavaScript files, which can be hosted on any web server that supports serving static files.

- GitHub Pages
  > GitHub Pages is a free hosting service that allows to host static websites and web apps directly from your GitHub repositories. It supports several SSGs, including Jekyll, Hugo, and Gatsby.

- Netlify
  > Netlify is a cloud hosting platform that provides a variety of features, including continuous deployment, custom domains, HTTPS, and serverless functions. It supports several SSGs, including Gatsby, Hugo, and Jekyll.

- Amazon S3
  > Amazon S3 is a cloud storage service that can be used to host static websites. It provides features such as high availability, scalability, and low latency. To host a static site on S3, you need to configure your S3 bucket for static website hosting.

- Google Cloud Storage
  > Google Cloud Storage is another cloud storage service that can be used to host static websites. It provides features such as global distribution, high availability, and scalability. To host a static site on Google Cloud Storage, you need to create a new bucket and configure it for static website hosting.

- Firebase Hosting
  > Firebase Hosting is a fast and secure hosting service that supports static websites and web apps. It provides features such as automatic SSL, CDN, and custom domains. To host a static site on Firebase Hosting, you need to create a new Firebase project and deploy your site using the Firebase CLI.

- GitLab Pages
  > GitLab Pages is a free hosting service that allows to host static websites and web apps directly from your GitLab repositories. It supports several SSGs, including Jekyll, Hugo, and Middleman.

- Surge
  > Surge is a simple and affordable hosting service for static sites. It provides features such as custom domains, SSL, and command-line deployment. To host a static site on Surge, you need to install the Surge CLI and deploy your site using the surge command.

- Cloudflare Pages
  > Cloudflare Pages is a modern hosting service that offers features such as automatic SSL, CDN, and custom domains. It supports several SSGs, including Hugo, Gatsby, and Next.js. Cloudflare Pages offers a generous free tier and scalable pricing based on usage.

- Vercel
  > Vercel is a cloud hosting platform that provides features such as continuous deployment, custom domains, SSL, and serverless functions. It supports several SSGs, including Gatsby, Next.js, and Hugo. Vercel offers a generous free tier and scalable pricing based on usage.

## 2. Principle

- Separation of content and presentation
  > SSGs separate the content and presentation layers of a website or web application. Content is stored separately from the website's layout and design, allowing developers to focus on the website's structure and functionality without worrying about the content.

- Build Process
  > SSGs use a build process to generate static files from templates and content sources. The build process involves parsing the content sources, applying the templates to the content, and generating static HTML, CSS, and JavaScript files. The resulting files can then be deployed to a web server or a hosting service.

- Templating
  > SSGs use templating languages, such as Liquid, Handlebars, or Mustache, to generate the HTML files. Templating allows developers to reuse code and generate dynamic content, such as blog posts or product pages, from a single template.

- Version control
  > SSGs work well with version control systems, such as Git, allowing developers to track changes to the website's code and content and collaborate with other developers.

- Flexibility
  > SSGs are highly flexible and can be used for a wide range of websites and web applications, from simple blogs to complex e-commerce sites. SSGs can also be combined with other web development tools, such as CSS preprocessors or JavaScript frameworks, to enhance the website's functionality and design.

- Content Sources
  > SSGs support various content sources, such as Markdown files, YAML files, JSON files, and databases. Content sources can be stored locally or remotely, and can be accessed using APIs or plugins.

- Plugins and Extensions
  > SSGs support plugins and extensions that extend their functionality and allow developers to add custom features. Plugins can be used to integrate with third-party services, such as Google Analytics and Disqus, and add functionality, such as search and forms.

- Performance and Security
  > SSGs generate static files that can be served directly from a web server or a CDN, which provides better performance and security than dynamic websites. SSGs also support HTTPS encryption and other security features to protect user data.

## 3. Best Practice

### 3.1. SSG

Static Site Generators (SSGs) are a type of web development tool that generate static HTML, CSS, and JavaScript files for websites or web applications.

- Choose the right SSG
  > Different SSGs have different strengths and weaknesses. Consider the requirements of the website or web application and choose an SSG that best fits those requirements.

- Use a version control system
  > Use a version control system like Git to track changes to your site's code and content. This allows to collaborate with others, roll back changes if necessary, and easily deploy updates.

- Use a local development environment
  > Develop the website or web application locally using a development server. This allows developers to test changes and ensure the website is working as expected before deploying it to a live server.

- Optimize images and other assets
  > Use tools, such as ImageOptim or TinyPNG, to optimize images and other assets before including them in the website. This reduces file size and improves load times.

- Use caching
  > Use caching to reduce server load and improve website performance. Caching stores frequently accessed data, such as images or stylesheets, on the client's browser, reducing the need for server-side processing.

- Implement responsive design
  > Implement responsive design to ensure the website is accessible and usable on a wide range of devices and screen sizes.

- Use HTTPS
  > Use HTTPS encryption to protect sensitive data, such as passwords or credit card information, transmitted between the client and server.

- Implement SEO best practices
  > Implement search engine optimization (SEO) best practices, such as using descriptive page titles and meta descriptions, to improve the website's visibility in search engine results.

- Monitor website analytics
  > Monitor website analytics, such as page views and bounce rates, to track the website's performance and identify areas for improvement.

- Use a CSS preprocessor
  > Use a CSS preprocessor like Sass or Less to write more efficient and organized CSS code. This allows to use variables, mixins, and other features to make your CSS code more modular and reusable.

- Use a task runner
  > Use a task runner like Gulp or Grunt to automate repetitive tasks, such as minification and concatenation of CSS and JavaScript files, image optimization, and deployment.

- Use a CDN
  > Use a content delivery network (CDN) to improve site performance and reduce server load. A CDN caches your site's files on servers located around the world, reducing the time it takes for users to access your site.

- Minifying files
  > Minifying HTML, CSS, and JavaScript files can reduce file size and improve site performance.

### 3.2. Deployment

Deployment is the process of publishing a website or web application to a web server or hosting platform so that it can be accessed by users. In the case of Static Site Generators, deployment typically involves uploading pre-built HTML, CSS, and JavaScript files to a web server or CDN.

- Build the site
  > Use the SSG to generate a build of your static site by compiling templates, generating pages and assets, and optimizing files for performance.

- Choose a hosting platform
  > There are many hosting platforms available for static sites, including cloud storage providers, content delivery networks (CDNs), and specialized static site hosting services.

- Upload the files
  > Once a hosting platform chosen, upload the generated files to the platform using a file transfer protocol (FTP) client or the hosting platform's web-based interface.

- Configure the domain
  > If you are hosting the site on your own domain, you will need to configure your domain's DNS settings to point to the hosting platform's servers.

- Test the site
  > Once the files have been uploaded and the domain has been configured, test the site to ensure that it is working correctly.

- Enable HTTPS
  > HTTPS is important for security and SEO, so it is recommended that you enable HTTPS on your static site. Many hosting platforms provide a way to enable HTTPS automatically or with minimal configuration.

- Configure caching
  > Caching can improve site performance by reducing the amount of data that needs to be downloaded by visitors' browsers. Many hosting platforms provide built-in caching options or integration with CDNs to improve site performance.

## 4. Terminology

- Template
  > A template is a file that defines the layout and structure of a website or web application. Templates typically use a markup language, such as HTML or Markdown, and may include variables and logic for generating dynamic content.

- Static site
  > A static site is a website that consists of pre-built HTML, CSS, and JavaScript files that are served directly from a web server, without the need for server-side processing or database queries.

- Content management system (CMS)
  > A CMS is a software application that allows users to create, manage, and publish digital content, such as blog posts or product descriptions. In the context of SSGs, a headless CMS can be used to manage content separately from the website's layout and design.

- Front-end framework
  > A front-end framework is a collection of pre-built HTML, CSS, and JavaScript components and tools that can be used to create responsive and dynamic web interfaces. Popular front-end frameworks include React, Vue.js, and Angular.

- Build process
  > The build process refers to the process of generating static files from source code and content using an SSG. The build process typically involves compiling templates, generating pages and assets, and optimizing files for performance.

- Plugin
  > A plugin is a piece of software that can be added to an SSG to extend its functionality. Plugins can be used to add new features, optimize site performance, or automate tasks.

- Deployment
  > Deployment refers to the process of uploading a website or web application to a web server or hosting platform so that it can be accessed by users. Deploying a static site typically involves uploading pre-built HTML, CSS, and JavaScript files to a web server or CDN.

- Front matter
  > Front matter is metadata that is stored at the beginning of a Markdown file or other content file in an SSG. Front matter can include variables such as the title, author, or date of a blog post, which can be used to generate dynamic content.

- Server-side rendering (SSR)
  > Server-side rendering is a process used in some web frameworks and platforms that generates HTML on the server before sending it to the client's browser. SSR can be used to improve site performance and SEO, but is not typically used in SSGs.

- CDN
  > A content delivery network (CDN) is a network of servers located around the world that can be used to distribute content, such as images, CSS files, and JavaScript files, to users more quickly and efficiently. Using a CDN can improve site performance and reduce server load.

- Minification
  > Minification is the process of removing unnecessary characters, such as whitespace and comments, from HTML, CSS, and JavaScript files. Minification can reduce file size and improve site performance.

- Incremental build
  > Incremental build is a feature available in some SSGs that allows for faster site rebuilds by only updating files that have changed since the last build, instead of rebuilding the entire site.

## 5. References

- Sentenz [docs as code](../about/docs-as-code.md) article.
