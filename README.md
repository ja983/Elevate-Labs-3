# Task 3: IaC with Terraform (Docker)

## What I did
Used Terraform with the kreuzwerker/docker provider to pull an nginx image
and run it as a container on port 8080.

## Steps
init → validate → plan → apply → verify (docker ps, browser) → state list/show → destroy

## Files
- main.tf – Terraform configuration
- logs-*.txt – execution logs for each step

## What I learned
Terraform is declarative, plan previews changes, state tracks real resources,
and destroy cleans everything up.
