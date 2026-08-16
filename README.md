# 🚀 FastAPI DevOps Sandbox & CI/CD Pipeline

A production-ready microservice template showcasing DevOps fundamentals: containerization, automated testing, non-root container security, and automated CI/CD pipelines.

![CI/CD Pipeline](https://github.com/Veszpremi-Csongor/fastapi-devops-sandbox/actions/workflows/ci.yml/badge.svg)
![Python Version](https://img.shields.io/badge/python-3.11-blue.svg)
![Docker](https://img.shields.io/badge/docker-ready-blue.svg)

---

## 🛠️ Tech Stack & Key Features

* **Framework:** FastAPI (Python 3.11) with Swagger UI documentation.
* **Testing & Linting:** `pytest` unit testing + `flake8` static code analysis.
* **Containerization:** Production-ready `Dockerfile` following best practices:
  * Minimal base image (`python:3.11-slim`).
  * Non-root execution (`appuser`) for enhanced container security.
  * Native Docker `HEALTHCHECK` endpoint integration.
* **CI/CD Automation:** GitHub Actions workflow executing linting, unit tests, and Docker image validation on every push/PR.

---

## 🚦 API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/` | Service root and status |
| `GET` | `/health` | Healthcheck endpoint for container monitoring |
| `GET` | `/info` | Service metadata and version info |
| `GET` | `/docs` | Interactive Swagger API documentation |

---

## ⚡ Quick Start (Local & Docker)

### 1. Run with Docker Compose (Recommended)
```bash
docker compose up --build