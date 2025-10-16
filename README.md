# SET09803 DevOps — Group 13
## World Population Reporting System

[![CI – develop](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml)
![Java](https://img.shields.io/badge/Java-24-%23b07219?logo=java)
![Maven](https://img.shields.io/badge/Maven-Wrapper-blue?logo=apachemaven)
![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)
![MySQL](https://img.shields.io/badge/MySQL-8.4-4479A1?logo=mysql)

A small Java + Maven application that performs **SQL-based analytics on the World database**, packaged with **Docker** and orchestrated via **Docker Compose**. CI is implemented in **GitHub Actions** and runs on the `develop` branch.

---

## Table of contents
- [Architecture](#architecture)
- [Tech stack](#tech-stack)
- [Quick start (Docker Compose)](#quick-start-docker-compose)
- [Local dev (no containers)](#local-dev-no-containers)
- [.env configuration](#env-configuration)
- [Common commands](#common-commands)
- [CI/CD pipeline](#cicd-pipeline)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## Architecture


- **Multi-stage Docker build**: compile with Maven, then run on a clean JRE 24 image.
- **Compose** brings up **app** and **mysql** with ports and credentials driven by `.env`.

---

## Tech stack
- **Language:** Java 24 (Temurin)
- **Build:** Maven Wrapper (`mvnw`) — Maven is not required on the host
- **Data:** MySQL 8.4
- **Container:** Docker / Docker Compose
- **CI:** GitHub Actions (`.github/workflows/ci.yml`)

---

## Quick start (Docker Compose)

> Prerequisites: Docker Desktop (or Docker Engine), Git.

1) Clone & checkout `develop`
```bash
git clone https://github.com/Group-13-DevOps/devops-group13-population-report.git
cd devops-group13-population-report
git switch develop
git pull --rebase
