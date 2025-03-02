# TimeTrakr

## Overview

**TimeTrakr** is a productivity tracking tool designed to help users measure and analyze their work efficiency. It allows users to log activities in a calendar, specify the time spent on each task, and visualize the data in various ways (e.g., by day or sprint). The goal is to provide a clear overview of time usage, enabling users to make informed decisions and optimize their workflow.

The application is built using a **hexagonal architecture** to ensure modularity, testability, and maintainability. It consists of a robust **NestJS backend** and a responsive **Vue.js frontend**, all orchestrated using **Docker Compose** for seamless development and deployment.

---

## Features

### Backend
- **NestJS**: A scalable and modular Node.js framework.
- **Hexagonal Architecture**: Separation of concerns with clear boundaries between domain, application, and infrastructure layers.
- **Authentication**: JWT-based authentication for secure access.
- **Swagger Documentation**: Auto-generated API documentation for easy testing and integration.
- **TypeORM**: Database abstraction with support for PostgreSQL and in-memory repositories for testing.
- **Validation**: Robust request validation using `class-validator` and `class-transformer`.

### Frontend
- **Vue.js**: A progressive JavaScript framework for building user interfaces.

### Infrastructure
- **Docker Compose**: Simplifies local development and ensures consistency across environments.
- **PostgreSQL**: A powerful, open-source relational database for persistent data storage.

---


## Getting Started

### Prerequisites

- **Docker**: Ensure Docker and Docker Compose are installed on your machine.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/chaparron/time-trackr.git
   cd time-trackr
   ```

2. Copy .env-test into .env in timeTrackr and timeTrackr/backend

3. Start the aplication using Docker Compose:
   ```bash
   docker-compose up
   ```

- This will:
  - Spin up a PostgreSQL database.
  - Start the NestJS backend on port 3000.
  - Start the Vue.js frontend on port 8080.

4. Access the application:

- Backend API: http://localhost:3000
- Swagger UI: http://localhost:3000/api
- Frontend: http://localhost:8080

5. Docker compose services

- **backend** - NestJS: 3000
- **frontend** - Vue.js: 8080
- **db** - PostgreSQL: 5432


## Api Documentation
The backend API is documented using Swagger. After starting the application, you can access the Swagger UI at:

   ```bash
   http://localhost:3000/api
   ```