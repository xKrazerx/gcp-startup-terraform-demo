# 🚀 GCP Startup Infrastructure Base (Terraform)

[![GCP](https://img.shields.io/badge/GCP-Google%20Cloud-4285F4?logo=google-cloud&logoColor=white)](https://cloud.google.com/)
[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D%201.5.0-7B42BC?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Looking for the complete, production-ready modular package?**  
> 📦 **[Download the full Terraform Blueprint on Gumroad](https://cloudblueprints.gumroad.com/l/gcp-startup-base)** — Includes modularized code for VPC, GKE Autopilot, Private Cloud SQL, deployment instructions, and default security standards.
📌 Architecture Overview
When bootstrapping new SaaS applications or startup workloads on Google Cloud Platform, security and cost-efficiency are critical. This repository showcases a battle-tested architecture designed to eliminate security misconfigurations (such as public databases) while maintaining minimal operational overhead.

                  +--------------------------------------------------+
                  |               GCP Project                        |
                  |                                                  |
                  |  +--------------------------------------------+  |
                  |  |         Custom VPC (10.0.0.0/20)          |  |
                  |  |                                            |  |
  +----------+    |  |  +------------------+  +----------------+  |  |
  | Internet | <--+--+--|    Cloud NAT     |  | GKE Autopilot  |  |  |
  +----------+    |  |  | (Outbound Egress) |  | (Private Nodes)|  |  |
                  |  |  +------------------+  +-------+--------+  |  |
                  |  |                                |           |  |
                  |  |  +-----------------------------v--------+  |  |
                  |  |  | Private Service Networking Peering   |  |  |
                  |  |  +-----------------------------+--------+  |  |
                  |  |                                |           |  |
                  |  |  +-----------------------------v--------+  |  |
                  |  |  | Private Cloud SQL (PostgreSQL 15)    |  |  |
                  |  |  |       (ipv4_enabled = false)         |  |  |
                  |  |  +--------------------------------------+  |  |
                  |  +--------------------------------------------+  |
                  +--------------------------------------------------+
🌟 Key Features
Zero Public IP Exposure for DB: Cloud SQL PostgreSQL instance configured exclusively with internal Private IP access (ipv4_enabled = false) via VPC Peering.

Controlled Egress with Cloud NAT: Private subnet nodes and pods access external APIs securely without assigning public IPv4 addresses to compute instances.

GKE Autopilot Integration: Fully managed Kubernetes compute layer using dedicated secondary IP ranges for Pods (10.1.0.0/16) and Services (10.2.0.0/20).

Production Best Practices: High-availability (HA) database option, automated daily backups, and custom VPC subnetting without default auto-subnets.

📦 What's Included in the Full Template?
The complete kit on Gumroad provides a clean, pre-structured workspace ready to run with terraform apply:

Plaintext
gcp-startup-base/
├── README.md                 # Deployment & API prerequisites guide
├── provider.tf               # HashiCorp GCP provider initialization
├── variables.tf              # Parameter definitions
├── main.tf                   # Root module orchestrator
├── outputs.tf                # Cluster endpoints & private IPs
├── terraform.tfvars.example  # Example configuration values
└── modules/
    ├── vpc/                  # Custom VPC, subnets, Cloud NAT & VPC Peering
    ├── gke/                  # Private GKE Autopilot cluster configuration
    └── database/             # High-Availability Cloud SQL (PostgreSQL 15)
👉 Get Full Access on Gumroad ($29)

🛠️ Quick Start (Prerequisites)
Ensure you have the following installed before deploying:

Terraform CLI (>= 1.5.0)

Google Cloud SDK (gcloud)

Enable Required GCP APIs
Bash
gcloud services enable compute.googleapis.com \
                       container.googleapis.com \
                       sqladmin.googleapis.com \
                       servicenetworking.googleapis.com
📄 License
This repository structure is licensed under the MIT License.
