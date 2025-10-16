[![CI](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml)
[![CI](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml)
# Population Reporting System — Group 13

SET09803 DevOps coursework project. Java + Maven + Docker + GitHub Actions.



[![CI - develop](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml)
[![CI - master](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml)
[![CI](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/Group-13-DevOps/devops-group13-population-report/actions/workflows/ci.yml)


Java + Maven + Docker + GitHub Actions. Run locally:

```bash
mvn package
docker compose --env-file .env up --build

---

Commit & push README changes (if any).

---

## 5) Protect `master` and `develop` (UI)
GitHub → **Settings → Branches → Add rule** for each:
- Require pull request before merging
- Require status checks to pass
- Disallow force pushes & deletions

This permanently prevents the “different histories” mistake.

---

## 6) Cut your **first release** for CR1
When the above commits are on `develop` (CI green):

```powershell
git fetch origin
git switch develop
git pull --rebase

git switch -c release/0.1.0
git push -u origin release/0.1.0






