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
| **002** | 2026-06-17 | Linux Admin & Security | Managing Ephemeral User Lifecycles with Account Expiration Constraints | [Link to Day 2 Folder](./Day-002) |
| **003** | 2026-06-18 | Linux Admin & Security | SSH Daemon Hardening & Restricting Direct Root Ingress Controls | [Link to Day 3 Folder](./Day-003) |

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

### Day 2: Ephemeral Access Management & Account Hardening
* **What I built/learned:**
    * Navigated multi-node systems architecture by securely pivoting through a Jump Host to apply configurations on remote cluster targets (`stapp03`).
    * Configured automated lifecycle management for third-party contractor access by provisioning a highly constrained, lowercase user profile (`jim`).
    * Enforced least-privilege security controls by establishing an absolute account expiration ceiling (`2027-01-28`) to mitigate unmanaged, stale identity vulnerabilities.
* **Challenges faced:** Validating that account termination policies successfully registered within the underlying system shadow configuration files.
* **How I solved it:** Utilized the low-level system aging audit tool `chage -l` to parse and verify active system policies directly.
* **Code/Scripts used:** Look inside the `Day-002` folder.


### Day 3: SSH Daemon Hardening & Multi-Node Perimeter Security
* **What I built/learned:**
    * Implemented infrastructure-wide transport layer compliance by auditing the OpenSSH daemon configuration file (`/etc/ssh/sshd_config`) across a distributed server cluster (`stapp01`, `stapp02`, `stapp03`).
    * Leveraged stream editing automation tools (`sed`) to programmatically inject system security boundaries, modifying configuration keys inline without breaking structural layout defaults.
    * Hardened data center threat vectors by setting `PermitRootLogin no` and recycling the `sshd` sub-system daemon process across all computing nodes.
* **Challenges faced:** Manually targeting multiple distinct bare-metal/virtual systems could introduce baseline drift.
* **How I solved it:** Normalized the mitigation logic into a standardized, reusable command pipeline, executing identical configuration modifications and service restarts on all targets systematically.
* **Code/Scripts used:** Look inside the `Day-003` folder.
