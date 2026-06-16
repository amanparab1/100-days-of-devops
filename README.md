# 100 Days of DevOps Challenge ⚙️🚀

Welcome to my 100-day DevOps challenge logbook. This repository serves as a centralized hub to document my daily hands-on implementation of enterprise system administration, configuration automation, CI/CD pipelines, containerization, and orchestration topologies.

## 🛠️ Core Focus Areas
*   **Systems Engineering:** Linux Administration, User & Access Control Management, Network Security
*   **Infrastructure & Automation:** Bash Scripting, Ansible, Git
*   **Cloud Native:** Docker, Kubernetes

---

## 📈 Daily Progress Log

| Day | Date | Focus Area | Core Concept / Task | Documentation / Code |
| :---: | :---: | :--- | :--- | :--- |
| **001** | 2026-06-16 | Linux Admin & Security | Provisioning System Service Accounts with Non-Interactive Shell Topologies | [Link to Day 1 Folder](./Day-001) |

---

## 📝 Detailed Logbook

### Day 1: Linux User Access Constraints & Service Account Hardening
*   **What I built/learned:**
    *   Explored system architecture boundaries within a multi-tier server environment by utilizing a centralized Jump Host to configure remote Application nodes.
    *   Implemented defensive access constraints by provisioning a specialized system user account (`john`) on App Server 1 (`stapp01`) reserved for third-party automated backup agent orchestration.
    *   Hardened system exposure vectors by binding the account explicitly to a non-interactive shell (`/sbin/nologin`), completely disabling interactive terminal login capability for security compliance.
*   **Challenges faced:** Enforcing security and access policies on remote production servers where direct external access is blocked.
*   **How I solved it:** Traversed the private network via secure SSH jump boxes and elevated execution bounds to a root administrative state (`sudo -i`) to modify the core configuration files.
*   **Code/Scripts used:** Look inside the `Day-001` folder.
