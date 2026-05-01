#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

terraform -chdir="$ROOT_DIR" fmt -check -recursive

for env in dev prod; do
  echo "==> Validating $env"
  terraform -chdir="$ROOT_DIR/environments/$env" init -backend=false
  terraform -chdir="$ROOT_DIR/environments/$env" validate
  terraform -chdir="$ROOT_DIR/environments/$env" plan -var-file="terraform.tfvars" -out="$env.tfplan"
done
