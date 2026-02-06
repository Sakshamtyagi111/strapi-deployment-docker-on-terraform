# 🚀 Terraform AWS Project — Private EC2 Strapi Deployment with ALB

## 📌 Project Overview

This project demonstrates how to design and deploy a production-style AWS infrastructure using **Terraform** to host a Strapi application on a **private EC2 instance**, accessible securely via an **Application Load Balancer (ALB)**.

The setup follows cloud and DevOps best practices:

* Private compute resources
* Public load balancer
* NAT for outbound internet
* Bastion host for SSH
* Automated provisioning via `user_data`
* Infrastructure as Code (IaC)

---

## 🏗️ Architecture

```
Local Machine (WSL)
        │
        ▼
Bastion Host (Public Subnet)
        │ SSH
        ▼
Private EC2 (Strapi App)
        │
        ▼
Application Load Balancer (Public)
        │
        ▼
Browser Access (/admin)
```

---

## 🧰 Tech Stack

* **Terraform**
* **AWS EC2**
* **AWS VPC**
* **NAT Gateway**
* **Application Load Balancer**
* **Security Groups**
* **Ubuntu Linux**
* **Node.js (NVM)**
* **Strapi CMS**
* **PM2 Process Manager**

---

## 📁 Project Structure

```
terraform-strapi-project/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
├── modules/
│   └── ec2/
│       ├── ec2.tf
│       ├── variables.tf
│       └── user_data.sh
│
└── README.md
```

---

## ⚙️ Infrastructure Components

### 1️⃣ VPC

* Custom CIDR block
* DNS hostnames enabled

### 2️⃣ Subnets

* Public subnet → ALB + Bastion
* Private subnet → Strapi EC2

### 3️⃣ NAT Gateway

* Allows private EC2 outbound internet
* Required for package installs

### 4️⃣ Security Groups

**ALB SG**

* Allow HTTP (80) from internet

**EC2 SG**

* Allow SSH from Bastion
* Allow App Port (1337) from ALB only

---

## 🖥️ EC2 Application Setup

Provisioned automatically via `user_data.sh`.

### Bootstraps:

* Installs dependencies
* Installs NVM
* Installs Node.js 20
* Installs PM2
* Creates Strapi project
* Builds admin panel
* Runs app in background

---

## 🌐 Application Access

After deployment:

```
http://<alb-dns>/admin
```

Create admin user and access dashboard.

---

## 🔐 SSH Access Flow

```
Local → Bastion → Private EC2
```

Example:

```bash
ssh -i key.pem ubuntu@<bastion-public-ip>
ssh ubuntu@<private-ec2-ip>
```

---

## 🚀 Deployment Steps

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Plan

```bash
terraform plan
```

### 3️⃣ Apply

```bash
terraform apply
```

### 4️⃣ Destroy (Cleanup)

```bash
terraform destroy
```

---

## 📊 Health Check Configuration

Target Group Health Check:

```
Path: /
Port: 1337
Matcher: 200–399
```

Ensures ALB routes traffic only when app is ready.

---

## 🧠 Key Learnings

* Deploying private workloads securely
* Using NAT for outbound internet
* Bastion host SSH design
* ALB → private app routing
* Automating app bootstrap
* Handling proxy + SPA routing
* Terraform modular design

---

## 🏁 Outcome

✔ Private EC2 deployed
✔ Strapi auto-installed
✔ Admin panel built
✔ ALB routing configured
✔ Bastion SSH working
✔ Fully automated via Terraform

---

## 📌 Future Enhancements

* HTTPS via ACM + ALB
* Dockerized deployment
* CI/CD pipeline
* Auto Scaling Group
* RDS database integration

---


## 👨‍💻 Author

**Name:** saksham tyagi
**Project:** Terraform Strapi Infra Deployment

---
