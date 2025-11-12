# secure-nginx-terraform-deployment
![Terraform Version](https://img.shields.io/badge/Terraform-v1.6.0-blue?logo=terraform)
![AWS Region](https://img.shields.io/badge/AWS-us--west--2-orange?logo=amazon-aws) 
![Security Scan](https://img.shields.io/badge/tfsec-passing-brightgreen?logo=githubactions)


This project automates the deployment of a secure, scalable, and production-ready Nginx web server using Terraform. It provisions the complete cloud infrastructure while adhering to industry-standard DevOps methodologies and security best practices.

## 📋 Table of Contents
1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Infrastructure Components](#infrastructure-components)
4. [Security Features](#security-features)
5. [GitHub Actions CI/CD Workflow](#github-actions-cicd-workflow)
6. [Prerequisites](#prerequisites)
7. [Setup & Deployment](#setup--deployment)
8. [Variables](#variables)
9. [Outputs](#outputs)
10. [Monitoring & Logging](#monitoring--logging)
11. [Future Improvements](#future-improvements)
12. [License](#license)


## 🧭 Overview

This repository provisions a **secure and scalable NGINX web server** infrastructure on AWS using Terraform.  
It includes:
- Automated deployment of EC2 instances in private subnets behind an Application Load Balancer (ALB)
- Enforced HTTPS with ACM SSL certificates
- AWS WAF WebACL for Layer-7 security
- CI/CD pipeline via GitHub Actions for continuous provisioning
- Automated server configuration through a custom **user data script**


## 🏗️ Architecture
      ┌─────────────────────────────────────────┐
      │               AWS Cloud                 │
      │ ┌─────────────────────────────────────┐ │
      │ │             VPC (Public & Private)  │ │
      │ │  ┌──────────────┐   ┌────────────┐ │ │
      │ │  │   ALB + SSL  │──▶│   EC2 ASG   │ │ │
      │ │  │ + WAF & SG   │   │(NGINX + Git)│ │ │
      │ │  └──────────────┘   └────────────┘ │ │
      │ │        │                  │         │ │
      │ │   Internet Gateway     NAT Gateway   │ │
      │ └─────────────────────────────────────┘ │
      └─────────────────────────────────────────┘

---

## ☁️ Infrastructure Components

| Component | Description |
|------------|-------------|
| **VPC** | Custom Virtual Private Cloud with public/private subnets |
| **ALB (Application Load Balancer)** | Routes HTTPS traffic to NGINX instances |
| **Auto Scaling Group (ASG)** | Ensures high availability and elasticity |
| **EC2 Instances** | Host the NGINX web server |
| **AWS ACM** | Provides SSL/TLS certificates for HTTPS |
| **AWS WAF** | Filters malicious web requests (SQLi, XSS, etc.) |
| **Security Groups** | Control inbound and outbound network traffic |
| **S3 Backend (optional)** | Stores Terraform state remotely |
| **CloudWatch** | Monitors logs and instance metrics |

---

## 🔐 Security Features

- **HTTPS Enforcement:** Redirects HTTP to HTTPS using ALB listeners  
- **WAF Protection:** Mitigates common web exploits via managed rules  
- **IAM Roles & Least Privilege:** Access managed through scoped IAM roles  
- **Auto Patching:** `user_data.sh` ensures automatic OS and package updates  
- **Secure Key Management:** AWS credentials and SSH key pairs managed via GitHub Secrets  

---

## ⚙️ GitHub Actions CI/CD Workflow

This project includes a robust **Terraform CI/CD pipeline** defined in `.github/workflows/terraform.yml`.  
It automates:

| Stage | Description |
|--------|--------------|
| 🧩 **Terraform Check** | Lints and validates code using `terraform fmt` and `terraform validate` |
| 🔎 **Static Security Scan** | Runs `tfsec` for security analysis |
| 🧠 **Terraform Plan** | Generates and previews infrastructure changes for PRs or dispatch events |
| 🚀 **Terraform Apply** | Deploys to AWS automatically upon merge to `main` or manual trigger |
| 💥 **Terraform Destroy** | Tears down resources safely using manual workflow dispatch |

---

### 🔑 Secrets Required

- `AWS_ACCESS_KEY_ID`  
- `AWS_SECRET_ACCESS_KEY`  
- `AWS_KEY_PAIR_NAME`

---

### Example Trigger

```bash
# Manual trigger (plan, apply, or destroy)
Actions > Run workflow > Action: apply
# 🌐 Secure Nginx Terraform Deployment

This project automates the provisioning of a **secure, production-ready Nginx web server** using **Terraform** on AWS.  
It integrates **AWS WAF**, **ACM SSL**, and **ALB** to ensure high availability, security, and scalability following DevOps best practices.

---

## 🧰 Prerequisites

- **Terraform** ≥ v1.6.0  
- **AWS Account** with IAM permissions for EC2, ALB, WAF, ACM, and VPC  
- **AWS CLI** configured locally  
- **GitHub repository secrets** set:
  - `AWS_ACCESS_KEY_ID`  
  - `AWS_SECRET_ACCESS_KEY`  
  - `AWS_KEY_PAIR_NAME`

---

## 🚀 Setup & Deployment

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/Benjamin-Klenam-Akakpo/secure-nginx-terraform-deployment.git
cd secure-nginx-terraform-deployment/terraform

### 2️⃣ Initialize Terraform
terraform init

### 3️⃣ Validate Configuration
terraform validate

### 4️⃣ Plan and Deploy
terraform plan -out=tfplan
terraform apply tfplan



## 🧩 Variables

| Variable         | Description                                       | Default                |
|------------------|---------------------------------------------------|------------------------|
| `aws_region`     | AWS region for resource deployment                | `us-west-2`            |
| `environment`    | Environment name (e.g., dev, prod)                | `dev`                  |
| `key_pair_name`  | Existing AWS EC2 key pair for SSH access          | `""`                   |
| `vpc_cidr`       | CIDR block for VPC                                | `10.0.0.0/16`          |
| `instance_type`  | EC2 instance type                                 | `t3.micro`             |
| `domain_name`    | Domain name for ACM SSL certificate               | `deploywithklenam.com` |

> See **`variables.tf`** for the full list of configurable parameters.

---

## 📊 Outputs

| Output              | Description                                   |
|----------------------|-----------------------------------------------|
| `load_balancer_url`  | Public endpoint of the deployed NGINX site    |
| `waf_arn`            | ARN of the Web Application Firewall           |
| `security_group_id`  | Security group associated with instances      |

---

## 🪶 `user_data.sh` Highlights

- Updates system packages  
- Installs and configures **NGINX**  
- Clones the website from **GitHub**  
- Registers **health check endpoints**  
- Configures **CloudWatch logging** for monitoring  

---

## 📈 Monitoring & Logging

- **CloudWatch Metrics:** Tracks CPU, memory, and network performance  
- **CloudWatch Logs:** Captures NGINX access and error logs for observability  
- **GitHub Actions Summary:** Displays deployment results and ALB endpoints  

---

## 🔮 Future Improvements

- Integrate **Terraform Cloud** for remote state and policy checks  
- Add **AWS Shield Advanced** for DDoS protection  
- Implement **Blue/Green deployment** strategy via ALB target groups  
- Extend **CI/CD** to include automated rollback on failed apply  

---

## 🪪 License

This project is licensed under the **MIT License** — see the [LICENSE](./LICENSE) file for details.
