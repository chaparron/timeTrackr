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
- **Redis**: Used for caching frequently accessed data, improving application performance. We implement a "cache-aside" strategy with cache invalidation:
    - Data is cached (in Redis) when it is created or read.
    - The cache is invalidated (entries are removed) when data is updated or deleted, ensuring the cache always reflects the current state of the database.

### Frontend
- **Vue.js**: A progressive JavaScript framework for building user interfaces.

### Infrastructure
- **Docker Compose**: Simplifies local development and ensures consistency across environments.
- **PostgreSQL**: A powerful, open-source relational database for persistent data storage.
- **Nginx**: Serves the Vue.js frontend and acts as a reverse proxy for the NestJS backend API.

---


## Getting Started

### Prerequisites

- **Docker**: Ensure Docker and Docker Compose are installed on your machine.

### Installation

1. CLONE THE REPOSITORY:
   ```bash
   git clone https://github.com/chaparron/timeTrackr.git
   cd timeTrackr
   ```

2. START THE APLICATION:
- Development mode
   ```bash
   ./start
   ```

   - This will:
   - Initialize and update Git submodules.
   - Start Docker containers defined in docker-compose.dev.yml
   - Includes:
      - NestJS backend on port 3000.
      - Vue.js frontend on port 5173.
      - PostgreSQL database on port 5432.

- Production mode
   ```bash
   ./start prod
   ```
   - Initialize and update Git submodules.
   - Start Docker containers defined in docker-compose.prod.yml.
   - Requires environment variables from .env.prod. Ensure you have a .env.prod file with the necessary variables (similar to .env.dev).
   - You can also add the CORS_ALLOWED_ORIGINS variable to .env.prod to restrict API requests to specific origins (e.g., CORS_ALLOWED_ORIGINS=http://your-frontend-domain.com).

3. ACCESS THE APLICATION:
- Development mode:
   - Swagger UI: http://localhost:3000/api-docs
   - Frontend: http://localhost:5173 

- Production mode:
   - Frontend: http://localhost

## Continuous Deployment

TimeTrakr has continuous deployment configured via GitHub Actions in the workflows located in `.github/workflows` of each repository (main and submodules). This enables automatic deployment of the application to the production environment whenever changes are made and pushed.

To make continuous deployment effective, you need to configure the following secret variables in GitHub Actions:

### Submodule Repositories (Frontend and Backend)

1.  **Create a GitHub App:**
    * Create a new GitHub App to allow authentication for the workflows.
2.  **Configure Secrets in GitHub Actions:**
    * In the "Secrets" settings of each submodule repository (frontend and backend), add the following variables:
        * `APP_ID`: The ID of the created GitHub App.
        * `APP_PRIVATE_KEY`: The private key of the GitHub App.
        * `APP_INSTALLATION_ID`: The installation ID of the GitHub App in the repository.

### Main Repository

1.  **Configure Secrets in GitHub Actions:**
    * In the "Secrets" settings of the main repository, add the following variables with your production server details:
        * `PROD_SERVER_IP`: The IP address of the production server.
        * `SSH_USERNAME`: The SSH username to access the server.
        * `SSH_PRIVATE_KEY`: The SSH private key to access the server.

**Note:** Ensure you manage these keys and secrets securely, as they provide access to your production server and the GitHub API.

## Api Documentation and usage
Within the Swagger UI, you can:

- Explore all exposed endpoints: This includes CRUD operations for events, user registration, user login, and a health check.
- Test endpoints directly: Use the Swagger UI to send requests and inspect responses, allowing you to interact with the backend API without needing the frontend.

## Frontend usage

In the frontend, you can:

- **Register and log in**: Create a new user account or log in with existing credentials.
- **Create events on different days**: Log your activities and specify the time spent on each task.
- **Persistent data**: Events are stored persistently, so they will still be available when you log in again after closing and reopening the application.
