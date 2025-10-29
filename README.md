# DevOps Assignment - Template Repository (ITA724)

**What this zip contains**
- `terraform/` — Terraform HCL files (skeleton) to create 4 EC2 instances and EIPs (PLACEHOLDERS).
- `ansible/` — Inventory and playbooks to install Docker, init Docker Swarm, and deploy stack.
- `docker/` — Dockerfiles for web (Django) and db (Postgres init), plus `docker-compose.yml` and `stack.yml`.
- `django_app/` — Minimal Django project implementing login/register/home/logout using Postgres.
- `scripts/` — `bootstrap.sh` to run the local sequence (placeholder) and helper scripts.
- `ci/` — GitHub Actions workflow (`ci.yml`) and example `Jenkinsfile`.
- `selenium/` — Simple Selenium test script (Python).
- `requirements.txt` — common Python dependencies for local testing.

**Important**
This repository is a *template*. It is intentionally minimal and contains placeholders (AWS credentials, keys, and real IPs).
Before applying Terraform or Ansible to real AWS, edit files in `terraform/` to add your AWS provider configuration and set variables. Do **NOT** use real credentials in source control.

See the `INSTRUCTIONS.md` for step-by-step information.

