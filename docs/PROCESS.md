# Terraform Process Guide

This document explains the Terraform process demonstrated by this repository.

## 1. Format

`terraform fmt` enforces consistent Terraform style.

```bash
terraform fmt -recursive
```

## 2. Initialize

`terraform init` downloads providers and prepares the working directory.

```bash
terraform init
```

## 3. Validate

`terraform validate` checks whether the Terraform configuration is syntactically valid.

```bash
terraform validate
```

## 4. Plan

`terraform plan` previews changes before they are applied.

```bash
terraform plan -var-file="terraform.tfvars"
```

## 5. Apply

`terraform apply` should normally be gated by review, approval, or a protected branch workflow.

```bash
terraform apply -var-file="terraform.tfvars"
```

## Recommended DevOps workflow

1. Developer opens a pull request.
2. CI runs format, init, validate, and plan.
3. Reviewer checks the Terraform plan output.
4. Approved changes are merged.
5. Apply is triggered manually or by a controlled release process.

## Environment strategy

This repo uses separate directories for each environment:

- `environments/dev`
- `environments/prod`

Each environment calls the same reusable module but passes different values.

## Secret management guidance

Do not commit secrets to Terraform code or tfvars files.

For real cloud projects, use one of these options:

- GitHub Actions secrets
- Cloud provider secret managers
- Terraform Cloud or OpenTofu/Terraform backend variables
- Vault or other enterprise secret management tools
