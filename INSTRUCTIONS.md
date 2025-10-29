# Instructions to run (high level)

1. Inspect files and update placeholders:
   - `terraform/variables.tf` — set `region`, `ami`, and other variables as required.
   - `terraform/provider.tf` — add AWS provider configuration (use environment variables or shared credentials).
   - `ansible/inventory.ini` — will be generated after Terraform apply (populate with EIPs).
   - `scripts/bootstrap.sh` — review before running.

2. Generate infra (example):
   - From `terraform/`:
     ```
     terraform init
     terraform apply -auto-approve
     ```
   - Terraform will output EIPs and will save `terraform-key.pem` locally (if you enable that logic).
   - Copy public IPs into `ansible/inventory.ini`.

3. From controller machine (with private key access), run:
   ```
   chmod +x scripts/bootstrap.sh
   ./scripts/bootstrap.sh
   ```
   This runs ansible-playbook(s) to install Docker & join nodes to Swarm and deploy the stack.

4. CI:
   - Use `ci/github-actions-ci.yml` as a starting point for GitHub Actions.
   - Or configure Jenkins and use `ci/Jenkinsfile`.

5. Local testing:
   - You can run docker-compose locally to test the app:
     ```
     docker-compose -f docker/docker-compose.yml up --build
     ```
   - The Django app settings are configured to use the service name `db` when using compose/swarm.

