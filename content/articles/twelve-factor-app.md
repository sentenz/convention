# Twelve-Factor App

The Twelve-Factor App is a methodology for building software-as-a-service applications to improve portability, scalability, and maintainability by adhering to twelve principles.

- [1. Category](#1-category)
  - [1.1. Codebase](#11-codebase)
  - [1.2. Dependencies](#12-dependencies)
  - [1.3. Config](#13-config)
  - [1.4. Backing Services](#14-backing-services)
  - [1.5. Build, Release, Run](#15-build-release-run)
  - [1.6. Processes](#16-processes)
  - [1.7. Port Binding](#17-port-binding)
  - [1.8. Concurrency](#18-concurrency)
  - [1.9. Disposability](#19-disposability)
  - [1.10. Dev/Prod Parity](#110-devprod-parity)
  - [1.11. Logs](#111-logs)
  - [1.12. Admin Processes](#112-admin-processes)
- [2. References](#2-references)

## 1. Category

### 1.1. Codebase

The `Codebase` factor in the Twelve-Factor App methodology states that each app should have exactly one codebase. That codebase is tracked in version control and can be deployed to multiple environments.

> [!NOTE]
> Separate codebases for a single app, or splitting one app across multiple repositories, does not adhere to this factor. The intent is one version-controlled codebase per app that can be deployed across environments.

1. Components and Features

    - Single Codebase
      > A codebase is the source code for a service or application. In the Twelve-Factor methodology, there should be exactly one codebase per app. If there are multiple codebases, it is a distributed system whose components are separate Twelve-Factor apps.

    - Multiple Deployments
      > The same codebase can be deployed to different environments, e.g. production, staging, and development. Each deployment can run a different release. The codebase remains the single source of truth for the app.

    - Version Control
      > The app codebase is tracked in a version control system such as Git, and many deploys (development, staging, production) can be executed from it.

### 1.2. Dependencies

The `Dependencies` factor focuses on managing software dependencies by explicitly declaring and isolating them.

> [!NOTE]
> Adhering to the `Dependencies` principle improves portability, scalability, and maintainability. It also makes development setup easier, supports consistent deployment across environments, and simplifies scaling.

1. Components and Features

    - Explicit Declaration
      > The application should declare all dependencies by using a dependency management tool such as pip for Python (`requirements.txt`) or npm for Node.js (`package.json`).

    - Isolation
      > Dependencies should be isolated to prevent conflicts between applications. This can be achieved through virtual environments in Python (`venv`) or containers (e.g. Docker, Podman).

2. Examples and Explanations

    Dependencies are explicitly declared, and isolation is achieved by installing dependencies in environments that are separate from the system global environment. This helps avoid version conflicts between projects.

    - Python
      > Python uses `pip` as its de facto standard package manager. Declare dependencies in a `requirements.txt` file, which can be generated using `pip freeze > requirements.txt`.

      ```python
      flask==1.1.2
      numpy==1.19.2
      pandas==1.1.3
      ```

      Install dependencies in an isolated environment using a virtual environment.

      ```bash
      python3 -m venv env
      source env/bin/activate
      pip install -r requirements.txt
      ```

    - Node.js
      > Node.js uses `npm` or `yarn` to manage dependencies, which are declared in a `package.json` file. Install dependencies using `npm install` or `yarn` command in an isolated `node_modules` directory environment.

      ```json
      {
        "name": "my-app",
        "version": "1.0.0",
        "dependencies": {
          "express": "^4.17.1",
          "mongoose": "^5.10.14",
          "dotenv": "^8.2.0"
        }
      }
      ```

    - Java
      > Java applications often use Maven for dependency management. Dependencies are declared in a `pom.xml` file. Maven automatically handles the installation of dependencies in an isolated local Maven repository environment.

      ```xml
      <project>
        ...
        <dependencies>
          <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.1</version>
            <scope>test</scope>
          </dependency>
          <dependency>
            <groupId>com.google.code.gson</groupId>
            <artifactId>gson</artifactId>
            <version>2.8.6</version>
          </dependency>
        </dependencies>
        ...
      </project>
      ```

### 1.3. Config

The `Config` factor advocates strict separation of configuration from code.

> [!NOTE]
> Adhering to the `Config` principle makes applications easier to configure and deploy across environments, improving developer productivity and system robustness.

1. Components and Features

    - Configuration
      > Any aspect of the application that can vary between deployments (staging, production, developer environments) should be extracted as configuration. This can include database handles, credentials for external services, and per-deploy values such as canonical hostnames.

    - Environment Variables
      > The Twelve-Factor App encourages storing configuration in environment variables. Environment variables are easy to change between deploys without code changes. Unlike config files, they are less likely to be committed accidentally, and unlike language-specific mechanisms (such as Java system properties), they are language- and OS-agnostic.

2. Examples and Explanations

    - Environment Variables
      > Store and access configurations in environment variables using `.env` files.

      ```dotenv
      DATABASE_URL=your-database-url
      SECRET_KEY=your-secret-key
      ```

    - Python
      > In Python, use `os.getenv()` to read configuration values from environment variables.

        ```python
        import os

        DATABASE_URL = os.getenv('DATABASE_URL')
        SECRET_KEY = os.getenv('SECRET_KEY')
        ```

    - Node.js
      > In Node.js, load environment variables and access them through `process.env`.

      ```javascript
      require('dotenv').config()

      console.log(process.env.DATABASE_URL);
      console.log(process.env.SECRET_KEY);
      ```

    - Java
      > In Java, use `System.getenv()` to read configuration values from the environment.

      ```java
      String databaseUrl = System.getenv("DATABASE_URL");
      String secretKey = System.getenv("SECRET_KEY");
      ```

### 1.4. Backing Services

The `Backing Services` factor treats all services an application relies on as attached resources. Backing services include databases, messaging/queueing systems, SMTP services, and caching systems.

> [!NOTE]
> Adhering to the `Backing Services` principle improves flexibility, portability across environments, and scalability under load.

1. Components and Features

    - Backing Services
      > Backing services are network-accessed services that an application uses. Examples include databases (like MySQL or MongoDB), messaging/queueing systems (like RabbitMQ or SQS), SMTP services for outgoing email, and caches (like Memcached or Redis).

    - Attached Resources
      > Treat backing services like databases, message brokers, and caches as attached resources. They should be accessed via a URL or connection string stored in the environment.

    - Swappable
      > The backing service should be easily replaceable without changing the application code, enhancing flexibility and scalability.

2. Examples and Explanations

    The backing service (a database in this case) is treated as an attached resource, and the same code is used whether it is local or third-party.

    - Python
      > Python with SQLAlchemy for database interaction. The database URL, whether it's a local database or a third-party one, can be stored as an environment variable.

      ```python
      import os
      from sqlalchemy import create_engine

      DATABASE_URL = os.getenv('DATABASE_URL')

      engine = create_engine(DATABASE_URL)
      ```

    - Node.js
      > Node.js with Mongoose for MongoDB interaction and object modeling. The MongoDB URI can be stored in an environment variable.

      ```javascript
      const mongoose = require('mongoose');
      require('dotenv').config();

      const uri = process.env.MONGODB_URI;

      mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true });
      ```

    - Java
      > Java using Spring Boot to interact with databases. The database URL can be stored in an `application.properties` or `application.yml` file.

      ```properties
      # application.properties
      spring.datasource.url=${DATABASE_URL}
      ```

### 1.5. Build, Release, Run

`Build, Release, Run` emphasizes distinct and well-defined stages in an application's lifecycle.

> [!NOTE]
> These stages should be strictly separated to ensure reliable, reproducible, and consistent deployments. Any change to the application moves back through these stages, creating a new release before entering the run stage. This workflow supports version tracking, problem diagnosis, and rollback.

1. Components and Features

    - Build Stage
      > Converts the code repository into an executable bundle. This might involve compiling code, packaging dependencies.

    - Release Stage
      > Combines the build with configuration data, resulting in a release that can be deployed to any environment.

    - Run Stage
      > Launches the application using a specific release. This stage is responsible for executing the code in the chosen environment.

### 1.6. Processes

The `Processes` factor emphasizes that applications should run as stateless, share-nothing processes. Any data that must persist should be stored in a stateful backing service, typically a database.

> [!NOTE]
> Adhering to the `Processes` principle improves scalability and resilience. Processes can be replicated to handle load, and a crash usually affects only a single request.

1. Components and Features

    - Stateless Processes
      > Application processes should be stateless and share-nothing. Data that needs to persist should be stored in a stateful backing service such as a database.

    - Ephemeral
      > Processes can start and stop at any time. They should be designed to handle this volatility gracefully.

2. Examples and Explanations

    - Python
      > Python application using Flask and a database as backing service for persistent data to avoid storing the state in the application.

      ```python
      from flask import Flask, request
      from flask_sqlalchemy import SQLAlchemy

      app = Flask(__name__)
      app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://user:pass@localhost/db'
      db = SQLAlchemy(app)

      class User(db.Model):
          id = db.Column(db.Integer, primary_key=True)
          name = db.Column(db.String(50))

      @app.route('/users', methods=['POST'])
      def create_user():
          name = request.json['name']
          new_user = User(name=name)
          db.session.add(new_user)
          db.session.commit()
          return f'User {name} has been created!', 201
      ```

    - Node.js
      > Node.js application using Express and a database like MongoDB to avoid storing state in the application.

      ```javascript
      const express = require('express');
      const app = express();
      const mongoose = require('mongoose');
      const { User } = require('./models/User');

      mongoose.connect('mongodb://localhost/test', {useNewUrlParser: true, useUnifiedTopology: true});

      app.use(express.json());

      app.post('/users', async (req, res) => {
          const { name } = req.body;
          const user = new User({ name });
          await user.save();
          res.status(201).send(`User ${name} has been created!`);
      });

      app.listen(3000);
      ```

### 1.7. Port Binding

The `Port Binding` factor in the Twelve-Factor App methodology emphasizes that applications should be self-contained and make services available to the outside world by binding to a specified port.

Port binding aligns with the principles of the Twelve-Factor App methodology, promoting portability, flexibility, and scalability. The application can run independently in a variety of environments, making it easier to manage and deploy.

1. Components and Features

    - Self-Contained Services
      > The application should be self-contained and expose services by binding to a port. For web applications, this means running an HTTP server inside the application (e.g., using Express in Node.js or Gunicorn in Python).

    - Port Binding
      > The application should be configured to bind to a specific port and handle incoming requests.

    - Environment-Based Configuration
      > The specific port number that the application binds to might be provided as an environment variable. This allows the configuration to change between different environments, such as development, testing, and production environments. It provides flexibility and helps to keep the environments isolated from each other.

2. Examples and Explanations

    - Node.js
      > Node.js application using Express, setting port number within an environment variable. If that variable isn't set, it defaults to 3000.

      ```javascript
      const express = require('express');
      const app = express();
      const port = process.env.PORT || 3000;

      app.get('/', (req, res) => res.send('Hello World!'));

      app.listen(port, () => console.log(`App listening on port ${port}!`));
      ```

    - Python
      > Python application using Flask, setting port number within an environment variable. If that variable isn't set, it defaults to 5000.

      ```python
      from flask import Flask
      import os

      app = Flask(__name__)
      port = int(os.getenv('PORT', 5000))

      @app.route('/')
      def hello_world():
          return 'Hello, World!'

      if __name__ == '__main__':
          app.run(host='0.0.0.0', port=port)
      ```

    - Java
      > Java application using Spring Boot, setting port number within an environment variable in `application.properties` file. If that variable isn't set, it defaults to 8080.

      ```properties
      # application.properties
      server.port=${PORT:8080}
      ```

### 1.8. Concurrency

The `Concurrency` factor advocates scaling out through the process model.

> [!NOTE]
> Adhering to the `Concurrency` principle helps applications handle varying load, increase fault tolerance, and improve overall performance.

1. Components and Features

    - Process Model
      > Scale out the application by running multiple processes or instances of the application. This can be achieved by leveraging process management tools or orchestrators like Kubernetes.

    - Types of Processes
      > Different process types (web servers, background workers) can handle different workloads and improve concurrency. For instance, long-running tasks can be handled by workers, while short request/response tasks can be handled by web processes.

    - Scaling Out
      > The Twelve-Factor App methodology emphasizes scaling out (horizontal scaling), rather than scaling up (vertical scaling). Scaling out means increasing the number of processes to handle more tasks simultaneously. This allows the application to distribute the load across multiple processes, making it more resilient and adaptable to changes in load. It contrasts with scaling up, which involves increasing the computational resources of an individual component.

2. Examples and Explanations

    - Node.js
      > Node.js has a built-in module called `Cluster` to create child processes (workers) that share server ports to scale an application.

      ```javascript
      const cluster = require('cluster');
      const os = require('os');

      if (cluster.isMaster) {
          const cpuCount = os.cpus().length; // Get the number of CPUs

          // Create a worker for each CPU
          for (let i = 0; i < cpuCount; i++) {
              cluster.fork();
          }
      } else {
          const express = require('express');
          const app = express();
          
          app.get('/', (req, res) => res.send('Hello from Worker!'));

          app.listen(3000);
      }
      ```

    - Java
      > Java using Spring Boot and Executors framework to manage threads to work with many tasks concurrently.

      ```java
      import java.util.concurrent.ExecutorService;
      import java.util.concurrent.Executors;

      public class App {
          private static final int NTHREDS = 10;

          public static void main(String[] args) {
              ExecutorService executor = Executors.newFixedThreadPool(NTHREDS);
              for (int i = 0; i < 500; i++) {
                  Runnable worker = new MyRunnable(10000000L + i);
                  executor.execute(worker);
              }
              executor.shutdown();
              while (!executor.isTerminated()) {
              }
              System.out.println("Finished all threads");
          }
      }
      ```

### 1.9. Disposability

The `Disposability` factor emphasizes maximum robustness through fast startup and graceful shutdown.

Applications that adhere to this factor improve robustness and resilience. They can handle unexpected changes in system state, such as sudden load increases or crashes. They are also more amenable to rapid scaling because new instances can start quickly.

1. Components and Features

    - Fast Startup
      > Applications should start quickly to facilitate rapid deployment and scaling.

    - Graceful Shutdown
      > Applications should shut down gracefully to handle termination signals (SIGTERM) properly, allowing for tasks to be completed or cleaned up.

2. Examples and Explanations

    - Node.js
      > Node.js using Express to listen for the SIGTERM signal and shut down gracefully.

      ```javascript
      const express = require('express');
      const app = express();
      const server = app.listen(3000);

      process.on('SIGTERM', () => {
          server.close(() => {
              console.log('Process terminated')
          })
      });
      ```

    - Python
      > Python applications using Flask to listen for the SIGTERM signal, designed to shut down gracefully when it receives a signal.

      ```python
      from flask import Flask
      import os
      import signal
      import sys

      app = Flask(__name__)

      def graceful_shutdown(signal, frame):
          print('SIGTERM received. Shutting down gracefully.')
          sys.exit()

      signal.signal(signal.SIGTERM, graceful_shutdown)

      if __name__ == '__main__':
          app.run(host='0.0.0.0', port=int(os.getenv('PORT', 5000)))
      ```

    - Java
      > Java application using Spring Boot `@PreDestroy` annotation to do cleanup before the application is terminated.

      ```java
      import javax.annotation.PreDestroy;

      import org.springframework.boot.SpringApplication;
      import org.springframework.boot.autoconfigure.SpringBootApplication;

      @SpringBootApplication
      public class Application {

          public static void main(String[] args) {
              SpringApplication.run(Application.class, args);
          }

          @PreDestroy
          public void preDestroy() {
              System.out.println("Application is about to terminate...");
              // Perform cleanup here
          }
      }
      ```

### 1.10. Dev/Prod Parity

The `Dev/Prod Parity` factor emphasizes keeping the gap between development and production as small as possible.

> [!NOTE]
> Minimizing this gap increases consistency between environments, reduces unexpected deployment issues, and improves reliability.

1. Components and Features

    - Time Gap
      > Minimize the time gap between writing code and deploying it to production, e.g. by using Continuous Integration/Continuous Deployment (CI/CD) pipelines.

    - Identical Environments
      > Keep development, staging, and production environments as similar as possible. Use the same type of backing services, same configurations, and similar infrastructure.

2. Examples and Explanations

    - Environment Variables
      > Use environment variables to manage configuration across different environments, ensuring that the same code can run in development, staging, and production without modification.

      ```dotenv
      # .env file for development
      DATABASE_URL=postgresql://localhost/dev_db
      ```

      ```javascript
      const mongoose = require('mongoose');
      const uri = process.env.DATABASE_URL;
      mongoose.connect(uri);
      ```

    - Containerization
      > Use containerization (e.g., Docker) to create consistent environments across development and production. This ensures that the application runs the same way regardless of where it is deployed.

      ```Dockerfile
      FROM node:14
      WORKDIR /app
      COPY package.json ./
      RUN npm install
      COPY . .
      EXPOSE 3000
      CMD ["npm", "start"]
      ```

### 1.11. Logs

The `Logs` factor emphasizes that applications should treat logs as event streams.

Applications should not manage routing and storage of their output streams. Instead, each process writes its event stream, unbuffered, to stdout. This makes it easy to collect logs with aggregation tools such as `Fluentd`, `Grafana Loki`, or `Logstash`, then forward them to centralized log management services for analysis.

> [!NOTE]
> Treating logs as event streams and decoupling log management from the application creates systems that are easier to observe, debug, and maintain.

1. Components and Features

    - Event Streams
      > Treat logs as continuous event streams. Write logs to stdout (standard output) and let the environment handle the aggregation, storage, and analysis.

    - Log Routing
      > Logs should be captured by the execution environment, collated together with logs from other applications, and then forwarded to a centralized log indexing and analysis system. This allows for more sophisticated analysis and troubleshooting across multiple services. Use tools like Logstash, Fluentd, or cloud-based logging services to collect and analyze logs.

2. Examples and Explanations

    - Node.js
      > Node.js, using Express with `console.log()` to write log messages to stdout.

      ```javascript
      const express = require('express');
      const app = express();

      app.get('/', (req, res) => {
          console.log('GET request received at /');
          res.send('Hello World!');
      });

      app.listen(3000, () => console.log('App listening on port 3000!'));
      ```

    - Python
      > Python using Flask with `logging` module to write log messages to stdout.

      ```python
      from flask import Flask
      import logging

      app = Flask(__name__)

      @app.route('/')
      def hello_world():
          app.logger.info('GET request received at /')
          return 'Hello, World!'

      if __name__ == '__main__':
          logging.basicConfig(level=logging.INFO)
          app.run(host='0.0.0.0', port=5000)
      ```

    - Java
      > Java using Spring Boot with Logback or Log4j to write log messages to stdout.

      ```java
      import org.slf4j.Logger;
      import org.slf4j.LoggerFactory;
      import org.springframework.boot.SpringApplication;
      import org.springframework.boot.autoconfigure.SpringBootApplication;
      import org.springframework.web.bind.annotation.GetMapping;
      import org.springframework.web.bind.annotation.RestController;

      @SpringBootApplication
      public class Application {
          public static void main(String[] args) {
              SpringApplication.run(Application.class, args);
          }

          @RestController
          public class HelloController {
              Logger logger = LoggerFactory.getLogger(HelloController.class);

              @GetMapping("/")
              public String hello() {
                  logger.info("GET request received at /");
                  return "Hello, World!";
              }
          }
      }
      ```

### 1.12. Admin Processes

The `Admin Processes` factor emphasizes that one-off administrative tasks should run in an environment identical to the app's long-running processes.

One-off admin processes run in the same environment as the app and are managed as part of the same codebase. This ensures they use the same code and follow the same release lifecycle.

> [!NOTE]
> Adhering to the `Admin Processes` principle ensures that regular and administrative tasks are subject to the same environmental conditions, reducing discrepancies and risk.

1. Components and Features

    - One-Off Tasks
      > Administrative tasks such as database migrations, maintenance scripts, or debugging tasks should be run as one-off processes in an environment identical to the application’s runtime.

    - Environment Consistency
      > Ensure that admin tasks have the same dependencies and configuration as the main application processes. This prevents issues caused by environmental differences and ensures consistency across all operations of the app.

    - Part of Application Codebase
      > Administrative code should be included in the application's codebase. This way, it evolves with the rest of the application, ensuring that these tasks can always be executed without compatibility issues.

2. Examples and Explanations

    - Node.js
      > In Node.js, you might have a script to seed a database. This script is run as a one-off process in the same environment, for example via a `package.json` script. Run the seed script with `npm run seed`.

      ```json
      "scripts": {
          "start": "node app.js",
          "seed": "node seed.js"
      }
      ```

    - Python
      > In Python with Django, create custom management commands. These can be run from the command line and are well-suited for administrative tasks. Run the seed command with `python manage.py seed`.

      ```python
      # app/management/commands/seed.py
      from django.core.management.base import BaseCommand
      from app.models import MyModel

      class Command(BaseCommand):
          help = 'Seeds the database'

          def handle(self, *args, **options):
              MyModel.objects.create(...)
      ```

    - Java
      > In Java using Spring Boot, create a CommandLineRunner bean for tasks that should be executed after the application context is loaded. Conditionally run the seeder based on a program argument or an environment variable.

      ```java
      import org.springframework.boot.CommandLineRunner;
      import org.springframework.stereotype.Component;

      @Component
      public class Seeder implements CommandLineRunner {

          @Override
          public void run(String... args) throws Exception {
              // Seed database here
          }
      }
      ```

## 2. References

- The [Twelve-Factor App](https://12factor.net/) page.
