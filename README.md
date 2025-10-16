# 🌍 Population Reporting System — SET09803 DevOps (Group 13)

[![CI](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml/badge.svg)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml)
[![CodeQL](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/codeql.yml/badge.svg)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/codeql.yml)
[![License: Apache-2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
![Java](https://img.shields.io/badge/Java-24-informational)
![Maven](https://img.shields.io/badge/Maven-3.9.x-informational)
![Docker](https://img.shields.io/badge/Docker-enabled-success)
![GitHub Actions](https://img.shields.io/badge/CI-CD%20Pipeline-success?logo=githubactions)
![GitFlow](https://img.shields.io/badge/GitFlow-Workflow-blueviolet)
![Zube Sync](https://img.shields.io/badge/Zube-GitHub%20Integration-success?logo=github)
![JUnit5](https://img.shields.io/badge/Testing-JUnit5-success)
![PMD](https://img.shields.io/badge/Code_Quality-PMD-green)

> A Java + MySQL system that produces population & demographic reports from the **World** database, built using GitFlow and CI/CD.

---

## 🧭 Project Overview

This project implements the **Population Reporting System** required by the coursework. It provides:

- Country, City, and Capital City reports (sorted by population; Top-N variants)
- Population totals & % living in cities vs not in cities
- Population lookups (world/continent/region/country/district/city)
- Language statistics for the top 5 world languages

The repo includes a Maven build (wrapper committed), Dockerfile, Docker Compose stack (MySQL + App), unit & integration tests, GitHub Actions, CodeQL, and Codecov.

---

## 🗺️ Roadmap (Milestones)

| Milestone | Description | Status |
|------------|-------------|--------|
| **CR1** | Project setup, GitFlow branches, backlog population, Maven & Docker setup | ✅ Completed |
| **CR2** | CI/CD pipelines, testing coverage, branch protection & review policy | ✅ Completed |
| **Final Delivery** | Documentation, Zube–GitHub sync verification, full deployment | 🟢 Ready |

---

## ⏱️ Quick Start

```bash
# 1) Clone
git clone https://github.com/Group-13-DevOps/devops-group13-population-report.git
cd devops-group13-population-report

# 2) Build (uses Maven Wrapper committed in repo)
./mvnw -q -DskipTests package
# Windows: .\mvnw.cmd -q -DskipTests package

# 3) Run stack with Docker Compose
# Create .env at repo root (adjust ports if needed)
# MYSQL_DATABASE=world
# MYSQL_USER=world_user
# MYSQL_PASSWORD=world_pass
# MYSQL_ROOT_PASSWORD=root_pass
# HOST_MYSQL_PORT=3306
# HOST_APP_PORT=8080
docker compose up --build
# MySQL → localhost:${HOST_MYSQL_PORT}
# App   → http://localhost:${HOST_APP_PORT}  (or console output if CLI)

# 4) Stop stack
docker compose down
```
---
## 🧪 Testing & Coverage

Unit tests: JUnit 5 + Surefire (DAOs / services)

Integration tests: Failsafe during verify (MySQL on 33060 or Testcontainers)

Coverage: uploaded to Codecov in CI (see badge at top)

---

## ⚙️ Technologies Used

| Category | Tools / Frameworks              |
|-----------|---------------------------------|
| **Language** | Java 24                         |
| **Build Tool** | Maven 3.9.x                     |
| **Database** | MySQL 8.4                       |
| **Testing** | JUnit 5, Failsafe Plugin        |
| **CI/CD** | GitHub Actions, Codecov, CodeQL |
| **Containerization** | Docker, Docker Compose          |
| **Code Quality** | PMD Plugin                      |
| **Version Control** | Git & GitHub (GitFlow Model)    |
| **IDE** | IntelliJ IDEA                   |

---

## 🌳 Git Workflow (GitFlow)

| Branch Type | Purpose |
|--------------|----------|
| `main` | Stable release branch |
| `develop` | Main integration branch |
| `release/*` | Pre-release staging |
| `feature/*` | Individual feature branches per member |

---

## 📊 Zube ↔ GitHub Integration Verification

To enable Agile collaboration, the project board on **Zube.io** was linked with **GitHub Issues** via **Zubebot**.

### 🔗 Integration Summary
- Project: `World Population Insights – Group 13`
- GitHub Repo: `devops-group13-population-report`
- Organization: `Group-13-DevOps`
- Zubebot installed and configured successfully ✅
- Cards auto-synchronized as GitHub Issues 🔄

### 🧪 Verification Example
A user story was created in Zube:

> **US-TEST: Verify Zube ↔ GitHub Issue Sync**

This card was added to the GitHub source repository via  
**“Add to source → devops-group13-population-report”**,  
automatically generating a matching GitHub Issue.

**Result:**
- 🟢 Zube card status → *Backed by GitHub Issue*
- 🟢 GitHub Issue created automatically with same title, labels, and assignee
- 🔁 Two-way sync validated (Zube ↔ GitHub)

**Proof Screenshot (for submission report):**
1. Zube Kanban Board showing synced card
2. GitHub Issues tab showing “US-TEST: Verify Zube ↔ GitHub Issue Sync”

---

## 📑 Functional Requirements (Assessment Specification)

The system outputs population and demographic reports from the **World** database.  
Each requirement (R01–R32) corresponds to a user story implemented under sprint epics.

### 🌍 Country Reports
| Requirement | Description |
|--------------|-------------|
| R01–R06 | Countries sorted by population, by world, continent, or region; top N countries in each scope |

**Columns:** `Code`, `Name`, `Continent`, `Region`, `Population`, `Capital`

---

### 🏙️ City Reports
| Requirement | Description |
|--------------|-------------|
| R07–R17 | Cities sorted by population by world, continent, region, country, or district; top N cities in each scope |

**Columns:** `Name`, `Country`, `District`, `Population`

---

### 🏛️ Capital City Reports
| Requirement | Description |
|--------------|-------------|
| R18–R23 | Capital cities sorted by population, and top N in each region or continent |

**Columns:** `Name`, `Country`, `Population`

---

### 👥 Population Reports
| Requirement | Description |
|--------------|-------------|
| R24–R29 | Population totals in each continent, region, and country; % living in cities vs non-cities |

**Columns:** `Name`, `TotalPopulation`, `InCities`, `InCities%`, `NotInCities`, `NotInCities%`

---

### 🧮 Population Lookups
| Requirement | Description |
|--------------|-------------|
| R30–R31 | Retrieve population for a world, continent, region, country, district, or city |

---

### 🗣️ Language Reports
| Requirement | Description |
|--------------|-------------|
| R32 | Top 5 world languages — Chinese, English, Hindi, Spanish, Arabic — by % of global population |




---
## 👥 CODEOWNERS (Team Roles)

| Area | Developer | GitHub Handle |
|------|------------|---------------|
| **City Reports / Lead** | Khant Soe Thwin | @KhantSoeThwin40794500 |
| Country Reports | Zay Lin Myat | @Zay12576 |
| Capital City Reports | Naing Lin Aung | @MinusAlgo4 |
| Population Reports | Swam Htet Win | @SwamHtetWin10|
| Population Lookups | Htet Wai Yan Lin | @HtetWai9671 |
| Language Reports | Moe Myint Thaw | @MoeMyintThawDevOps|

📄 *File:* `.github/CODEOWNERS`  
🔒 *Protected Branches:* `master`, `develop`, `release/*`


---

## 🧪 Testing Overview

### 🧩 Unit Testing
- Implemented using **JUnit 5** and the **Maven Surefire Plugin**
- Focused on individual components:
    - `CityDAO`
    - `CountryDAO`
    - `DatabaseConnector`
    - `PopulationCalculator`

### 🔗 Integration Testing
- Located under `src/integration-test/java`
- Uses **local MySQL (port 33060)** or **TestContainers**
- Managed through **Maven Failsafe Plugin**
- Executed during the `verify` phase

### 📈 Coverage
- Coverage uploaded to **Codecov**
- Achieved **>80%** coverage target ✅

---

## 🧠 UML Diagrams

The project includes two UML diagrams created using **PlantUML** in IntelliJ IDEA:

- ✅ **Use Case Diagram** — illustrates the main actors and their interactions with the system.
- ✅ **Class Diagram** — represents the system structure, showing classes, attributes, methods, and relationships.

Both diagrams follow the **Software Engineering Methods** design standards and are stored in the directory:

---

## 🚀 CI/CD

- ci.yml — builds master and develop, runs unit & integration tests, packages JAR, builds Docker image

- codeql.yml — static security analysis (CodeQL)

- Codecov — uploads test coverage (badge at top)

- Releases — GitHub Releases tagged from master

---

---

## 🔄 Continuous Integration & Deployment

| Workflow | Purpose |
|-----------|----------|
| `ci.yml` | Runs Maven tests, verifies the build, and uploads coverage to Codecov. |
| `codeql.yml` | Performs static code security analysis with GitHub CodeQL. |
| `maven.yml` | (Optional) Ensures dependency management and build stability. |
| `Dockerfile` | Builds the production-ready application image for container deployment. |

All workflows are fully **automated via GitHub Actions**, ensuring continuous integration (CI) and code quality checks.  
Badges for build, CodeQL, and Codecov are displayed at the top of this README ✅.

---

## 📜 License

---

## 🏁 Summary

✅ Successfully developed the **Population Reporting System** — a complete DevOps-based Java project.  
✅ Includes **Docker**, **CI/CD**, **Testing**, **UML**, and **Code Quality** integration.  
✅ Follows the **GitFlow** branching model for structured collaboration.  
✅ Implements both **Unit** and **Integration Testing** with over **80% coverage**.  
✅ Designed and documented using **PlantUML** and **PMD** for maintainability.  
✅ Fully aligned with **Labs 03b → 10** objectives for **SET09803 Software Engineering Methods**.  