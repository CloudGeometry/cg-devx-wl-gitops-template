# Workload IaC

This is your Workload Infrastructure as Code (IaC) main folder.
CG DevX is designed to parametrize and execute IaC programmatically.

## Blocks

Code is organized using the following independent blocks:

### Cloud Infrastructure

Infrastructure management organised under `infrastructure` folder.

### Secrets

Workload secrets management organised under `secrets` folder.

## PR automation


All of our terraform is automated with a tool called Atlantis that integrates with your Git pull requests. To see the
terraform entry points and under what circumstance they are triggered, see [atlantis.yaml](../atlantis.yaml).

Any change to a `*.tf` file, even a whitespace change, will trigger its corresponding Atlantis workflow once a pull
request is submitted. Within a minute it will post the plan to the pull request with instruction on how to apply the
plan if approved.
