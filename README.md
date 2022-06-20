# Vault Operations Professional Exam Prep

This repository is dedicated to preparing to become a HashiCorp certified Vault Operations Professional.

The exam will involve problems provided in the following fashion

| Format | Description |
| - | - |
| Hands-on | Perform the instructed operational tasks using the Vault CLI or UI in the given Linux environments. |
| Multiple-choice | Choose one or more correct responses from the multiple response options. |
| Hybrid | For a given multiple-choice question, inspect the provided Vault environment to discover the correct response. |

# Table of Contents

* Vault Operations Concepts
* Hands-on scenarios

# Vault Operations Concepts

The HashiCorp Vault Operations Professional exam involves having an adept understanding of the following concepts. Resources to validate compentecy in these fields are also provided.

| Concept | Learning Resources |
| - | - |
| Linux skills such as list and edit files via command terminal | # |
| Understanding of IP networking | # |
| Experience with Public Key Infrastructure (PKI), including PGP and TLS | # |
| Information security fundamentals such as network security and RBAC | # |
| Understanding containers: starting and stopping services, and reading logs | # |

# Hands-on Scenarios

The HashiCorp Vault exam will require takers to perform the following tasks. Resources on the tasks are also provided in the table below.

| Task | Learning Objectives | Learning Resources |
| - | - | - |
| Initializing a Vault node using Integrated Storage | <ul><li>Demonstrate that you can create a Vault server configuration file based on a given requirements.</li><li>Understand how to configure Vault Auto-Unseal.</li><li>Understand the mechanics of setting up a HA cluster.</li><li>Initialize & harden a Vault server.</li></ul> | # |
| Authentication methods and secret engines | <ul><li>Enable & configure Vault Auth Methods</li><li>Enable & configure Vault Secrets Engines</li></ul> | # |
| Vault Enterprise Replication | <ul><li>Set up Disaster Recovery (DR) Replication across the given Vault clusters.</li><li>Set up Performance Replication with paths filter based on a given requirement.</li></ul> | # |
| Vault Agent and Templating | <ul><li>Setup & configure Vault Agent Auto-Auth</li><li>Setup & configure Vault Agent Templates</li></ul> | # |

# Exam Topics To Be Familiar With


| Exam Objective | Documentation | Tutorial |
| - | - | - |
| 1 | Create a working Vault server configuration given a scenario | # | # |
| 1a |	Enable and configure secret engines | Secrets Engines </br> Secrets Command | Secrets Management |
| 1b |	Practice production hardening	Security Model	Production Hardening
| 1c |	Auto unseal Vault	Seal stanza	Auto Unseal
| 1d |	Implement integrated storage for open source and Enterprise Vault	Integrated Storage (Raft) Backend	Integrated Storage
| 1e |	Enable and configure authentication methods	Auth Methods	Auth Methods
| 1f |	Practice secure Vault initialization	operator init command	Deploy Vault
| 1g |	Regenerate a root token	operator generate-root command	Generate Root Tokens Using Unseal Keys
| 1h |	Rekey Vault and rotate encryption keys	operator rekey command	Rekeying & Rotating Vault
| 2 |	Monitor a Vault environment		
| 2a |	Monitor and understand Vault telemetry	Telemetry	Monitor Telemetry & Audit Device Log Data
| 2b |	Monitor and understand Vault audit logs	audit command	Troubleshooting Vault
| 2c |	Monitor and understand Vault operational logs	server command	Troubleshooting Vault
| 3 |	Employ the Vault security model		
| 3a |	Describe secure introduction of Vault clients		Secure Introduction of Vault Clients
| 3b |	Describe the security implications of running Vault in Kubernetes		Vault on Kubernetes Security Considerations
| 4 |	Build fault-tolerant Vault environments		
| 4a |	Configure a highly available (HA) cluster	High Availability Mode (HA)	Vault HA Cluster with Integrated Storage
| 4b |	(Vault Enterprise) Enable and configure disaster recovery (DR) replication	Vault Enterprise Replication	Disaster Recovery Replication Setup
| 4c |	(Vault Enterprise) Promote a secondary cluster	/sys/replication/dr	Disaster Recovery Replication Setup
| 5 |	Understand the hardware security module (HSM) integration		
| 5a |	(Vault Enterprise) Describe the benefits of auto unsealing with HSM	Vault Enterprise HSM Support	HSM Integration - Seal Wrap
| 5b |	(Vault Enterprise) Describe the benefits and use cases of seal wrap (PKCS#11)	Vault Enterprise HSM Support	HSM Integration - Seal Wrap
| 6 |	Scale Vault for performance		
| 6a |	Use batch tokens	Tokens	Batch Tokens
| 6b |	(Vault Enterprise) Describe the use cases of performance standby nodes	Performance Standby Nodes	Performance Standby Nodes
| 6c |	(Vault Enterprise) Enable and configure performance replication	Vault Enterprise Replication	Setting up Performance Replication
| 6d |	(Vault Enterprise) Create a paths filter	/sys/replication/performance	Performance Replication with Paths Filter
| 7 |	Configure access control		
| 7a |	Interpret Vault identity entities and groups	Identity Secrets Engine	Identity: Entities and Groups
| 7b |	Write, deploy, and troubleshoot ACL policies	Policiespolicy command	Policies
| 7c |	(Vault Enterprise) Understand Sentinel policies	Sentinel	Sentinel Policies
| 7d |	(Vault Enterprise) Define control groups and describe their basic workflow	Vault Enterprise Control Groups	Control Groups
| 7e |	(Vault Enterprise) Describe and interpret multi-tenancy with namespaces	Vault Enterprise Namespaces	Secure Multi-Tenancy with Namespaces
| 8 |	Configure Vault Agent		
| 8a |	Securely configure auto-auth and token sink	Vault Agent Auto-Auth	Vault Agent with AWS Vault Agent with Kubernetes
| 8b |	Configure templating	Vault Agent Templates	Vault Agent Templates
