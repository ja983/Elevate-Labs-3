1) What is IaC?
Managing and provisioning infrastructure through version-controlled code instead of manual setup, which makes it repeatable,
reviewable, and automatable.

2) How does Terraform work?
You write declarative .tf files, and Terraform compares them to the state file and real infrastructure.
It builds a dependency graph, then calls provider APIs to create, update, or delete resources. Workflow: write → init → plan → apply.

3) What is the state file?
terraform.tfstate maps your config to real resources and stores their attributes. Terraform uses it to compute diffs.
It can contain secrets, so use remote backends (S3 with locking, Terraform Cloud) for teams and never commit it.

4) Apply vs plan?
plan is a dry run that shows what would change without touching anything. apply executes those changes
(and shows a plan first unless you pass -auto-approve).

5) Providers?
Plugins that let Terraform talk to an API (AWS, Azure, Docker, Kubernetes, and so on). They're downloaded during terraform init.

6) Resource dependency?
One resource needing another to exist first. It can be implicit, through a reference like docker_image.nginx.image_id, or explicit,
through depends_on. Terraform uses this to order operations and parallelize independent ones.

7) Secret variables?
Mark variables sensitive = true, supply them via environment variables (TF_VAR_x) or a secrets manager (Vault, AWS Secrets Manager),
never hardcode them or commit .tfvars with secrets, and protect the state file since secrets can end up in it.

8) Benefits?
Cloud-agnostic with a huge provider ecosystem, declarative and idempotent, plan-before-apply safety, version control and collaboration,
reusable modules, drift detection, and consistent environments.
