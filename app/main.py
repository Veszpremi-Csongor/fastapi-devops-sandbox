from fastapi import FastAPI
import os

app = FastAPI(
    title="DevOps Sandbox API",
    description="Minimal FastAPI service demonstrating CI/CD & Docker best practices",
    version="1.0.0",
)


@app.get("/")
def read_root():
    return {
        "message": "Welcome to the DevOps Sandbox API!",
        "status": "running",
        "docs_url": "/docs"
    }


@app.get("/health")
def health_check():
    """Health check endpoint for Docker & container orchestrators."""
    return {
        "status": "healthy",
        "environment": os.getenv("APP_ENV", "production")
    }


@app.get("/info")
def get_info():
    return {
        "app": "fastapi-devops-sandbox",
        "version": "1.0.0",
        "maintainer": "Csongor Veszpremi"
    }