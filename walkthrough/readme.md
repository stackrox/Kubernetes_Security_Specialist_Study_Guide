# Certified Kubernetes Security Specialist Study Guide 

<p align="center">
  <img width="360" src="img/kcss_logo.png">
</p>

- [Certified Kubernetes Security Specialist Study Guide](#certified-kubernetes-security-specialist-study-guide)
  - [Repository Structure](#repository-structure)
  - [Getting Started](#getting-started)
    - [p0_intro](#p0_intro)
      - [Setup](#setup)
      - [Cleanup](#cleanup)
    - [p1_cluster_setup](#p1_cluster_setup)
      - [Questions](#questions)
      - [Answers](#answers)
  - [Issues](#issues)

## Repository Structure

```shell
└ walkthrough/
  └ p0_intro/
    └ readme.md
    └ cleanup.sh
    └ init.sh
    └ cluster_yamls /
      └ readme.md
  └ p1_cluster_setup /
    └ readme.md
    └ answers /
      └ readme.md
  └ readme.md
```

## Getting Started

### p0_intro 

p0_intro has the information to setup the cluster environment with example YAML's

#### Setup

After the cluster has been deployed. You can enable the *test environment* by executing the `init.sh` file.

#### Cleanup
You can always resent the environment by running `./cleanup` as well.

### p1_cluster_setup

#### Questions

The Questions are at the bottom of the readme.md file in the folder. ALong with the resources from the main readme file. 

#### Answers

The answers along with a brief description are outlined in the `solutions/readme.md` file.

## Issues

If the solutions are not working please open up an issue. :) Thanks!