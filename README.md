# Terraform Process Showcase

A safe, GitHub-ready Terraform demo project that showcases a professional DevOps workflow without creating cloud resources or requiring Azure/AWS/GCP credentials.

This project is intended for a portfolio or public profile. It demonstrates how you structure Terraform code, validate changes, review plans, and separate environments.

## What this demonstrates

- Terraform project structure
- Reusable module design
- Environment separation for `dev` and `prod`
- Variable validation and outputs
- `terraform fmt`, `init`, `validate`, and `plan`
- GitHub Actions CI for pull requests
- Manual approval-style apply workflow
- Safe local providers only: `random` and `local`

## Repository structure

```text
.
├── .github/workflows/
│   ├── terraform-ci.yml
│   └── terraform-apply.yml
├── environments/
│   ├── dev/
│   └── prod/
├── modules/
│   └── profile-site-metadata/
├── docs/
│   └── PROCESS.md
├── scripts/
│   └── validate-local.sh
├── .gitignore
└── README.md
```

## Quick start

Install Terraform, then run:

```bash
cd environments/dev
terraform init
terraform fmt -check -recursive ../..
terraform validate
terraform plan
```

To run both environments locally:

```bash
bash scripts/validate-local.sh
```

## How to showcase this on GitHub

1. Create a new repository named `terraform-process-showcase`.
2. Push this project to GitHub.
3. Open a pull request that changes a variable in `environments/dev/terraform.tfvars`.
4. Show the GitHub Actions workflow running `fmt`, `validate`, and `plan`.
5. Use the manual apply workflow only as a demo, since this project only writes local files inside the runner.

## No cloud cost

This project does not provision real infrastructure. It uses:

- `random_id` to simulate generated environment IDs
- `local_file` to simulate generated deployment metadata

That makes it safe for public demos and interviews.

## Suggested talking points for interviews

- I separate infrastructure by environment.
- I use modules to avoid copy-paste Terraform.
- I validate and plan infrastructure changes before apply.
- I use pull request checks before deployment.
- I keep environment-specific values in tfvars files.
- I avoid storing secrets in Terraform code.
- I document the process so the team can operate it consistently.
