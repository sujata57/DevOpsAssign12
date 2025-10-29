#!/usr/bin/env bash
set -e
echo "Bootstrap script (template)."
echo "1) Run Terraform from terraform/ to create instances and EIPs."
echo "2) Copy the outputs (EIPs) into ansible/inventory.ini."
echo "3) From the controller machine (with SSH key), run:"
echo "   ansible-playbook -i ansible/inventory.ini ansible/playbooks/setup_docker.yml"
echo "   ansible-playbook -i ansible/inventory.ini ansible/playbooks/init_swarm.yml"
echo "   ansible-playbook -i ansible/inventory.ini ansible/playbooks/deploy_stack.yml"
echo ""
echo "This script does not auto-run Terraform/Ansible to avoid accidental charges."
