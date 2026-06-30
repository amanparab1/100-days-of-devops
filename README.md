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
| **001** | 2026-06-16 | Linux Admin & Security | Provisioning System Service Accounts with Non-Interactive Shells | [Code](./Day-001/) |
| **002** | 2026-06-17 | Linux Admin & Security | Managing Ephemeral User Lifecycles with Account Expiration Ceilings | [Code](./Day-002/) |
| **003** | 2026-06-18 | Linux Admin & Security | SSH Daemon Hardening & Restricting Direct Root Ingress Controls | [Code](./Day-003/) |
| **004** | 2026-06-23 | Linux File Permissions | Granting Multi-User Read & Execute Automation Rights (`a+rx`) | [Code](./Day-004/) |
| **005** | 2026-06-24 | Linux Kernel Security | Staging Post-Reboot SELinux Disabling via Config Stream Updates | [Code](./Day-005/) |
| **006** | 2026-06-27 | Linux Task Automation | Provisioning `cronie` Daemons & Scheduling Multi-Node Spool Jobs | [Code](./Day-006/) |
| **007** | 2026-06-28 | Systems Security | Bootstrapping 4096-bit RSA Asymmetric Password-less Cluster Auth | [Code](./Day-007/) |
| **008** | 2026-06-29 | Config Management | Ansible Controller Setup | Deployed global Ansible `4.8.0` orchestration binaries via `pip3` across multi-user execution bounds. | [Code](./Day-008/) |
| **009** | 2026-06-30 | Database Reliability | Diagnosing MariaDB Failures & Repairing Directory Permission Drifts | [Code](./Day-009/) |
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


### Day 4: Linux File System Permissions & Script Execution Hardening
* **What I Did:** Resolved an issue on xFusionCorp Industries' App Server 1 where a distributed backup script (`/tmp/xfusioncorp.sh`) lacked the necessary execution bits for deployment automation.
* **Key Concepts:** Linux Permission Tiers (User, Group, Others), Symbolic notation formatting, Shell execution mechanics.
* **Technical Details:**
    * Target Path: `/tmp/xfusioncorp.sh`
    * Action Taken: Utilized symbolic assignment `chmod a+rx` to modify the permission flags uniformly.
    * Key Takeaway: Learned that for interpreted languages (like Bash/Python), a file needs both the **execute (`x`)** bit *and* the **read (`r`)** bit enabled for non-root users. If only execute is set, the kernel can run the binary wrapper but the shell interpreter will throw a "Permission denied" error when trying to read the code blocks inside.
 

### Day 5 (Part 2): Kernel Security Baselines & SELinux Lifecycle Management
* **What I Did:** Completed an urgent security compliance requirement on App Server 1. Installed core SELinux subsystems and staged a configuration structure to fully disable kernel enforcement hooks upon the system's scheduled nightly maintenance reboot.
* **Key Concepts:** Kernel security states (Enforcing, Permissive, Disabled), Package pipeline deployment, Configuration state persistence.
* **Technical Details:**
    * Targeted Configurations: `/etc/selinux/config`
    * Logic Constraints: Avoided short-term runtime modifications via `setenforce` to prevent processing collisions before the maintenance window. Instead, used `sed` replacement logic (`^SELINUX=.*/) to intercept the parameters at rest.
    * Takeaway: Understood that updating configuration variables at rest ensures system reliability during automated bare-metal configuration cycles.
 

### Day 6: Cron Orchestration & Scheduled Automation Execution
* **What I Did:** Deployed and verified a cluster-wide automated job runner blueprint across all Nautilus application servers (`stapp01`, `stapp02`, `stapp03`). Instantiated daemon runtime lifecycles and injected an automated background validation task.
* **Key Concepts:** Crontab Syntaxes, Spool Scheduling, Non-interactive Stream Piping, Init system initialization (`systemctl`).
* **Technical Details:**
    * Subsystem Engine: Installed `cronie` (the standard scheduling tool block for RHEL environments).
    * Job Schedule Expression: `*/5 * * * *` (Evaluates dynamically to fire every 5th minute across hours, days, and months).
    * Stream Automation Vector: Avoided interactive editors (`crontab -e`) inside the setup script by streaming the configuration profile directly to the standard input processor via `echo "..." \| crontab -`.
 

### Day 7: Asymmetric Cryptography & Cross-Node Trust Relations
* **What I Did:** Generated a dedicated high-entropy RSA cryptographic key pair on the centralized cluster orchestration node (Jump Host) and bootstrapped secure, password-less authentication bindings to all remote application targets (`stapp01`, `stapp02`, `stapp03`).
* **Key Concepts:** Public Key Cryptography, Asymmetric Trust Boundaries, Identity Verification, Key Distribution Security.
* **Technical Details:**
    * Encryption Vector: 4096-bit RSA key lengths to guarantee high computational security over the internal network segment.
    * Mechanism of Action: Appended the Jump Host's public identity signature (`id_rsa.pub`) into the remote targets' native `~/.ssh/authorized_keys` file via the automated `ssh-copy-id` utility pipeline.
    * Automation Significance: Establishing non-interactive SSH transport pipelines removes manual friction points, serving as the required layer for multi-node configuration tools.



### Day 8: Configuration Management Bootstrapping & Controller Provisioning
* **What I Did:** Transitioned cluster orchestration from imperative shell scripts to declarative configuration management. Bootstrapped the Jump Host as a centralized Ansible Controller by deploying Ansible `4.8.0` globally across system environments.
* **Key Concepts:** Imperative vs. Declarative Infrastructure, Global vs. Virtualenv Package Bounds, Binary $PATH Mapping, Package Dependency Trees.
* **Technical Details:**
    * Deployment Vector: `sudo pip3 install ansible==4.8.0`. Executing via root privileges bypassed user-local staging (`~/.local/bin`) and pushed the binaries into `/usr/local/bin`, ensuring multi-user accessibility across the operating system.
    * Dependency Quirks: Learned to differentiate between `ansible-core` (the bare execution engine showing v2.11.12) and the curated `ansible` community package bundle (v4.8.0).



### Day 9: Database Reliability Engineering & Incident Response
* **What I Did:** Acted as a first responder for a critical production outage in the Stratos Datacenter where the internal Nautilus application lost database connectivity. Diagnosed the root cause by analyzing `systemd` journal logs and restored the MariaDB service.
* **Key Concepts:** Daemon Lifecycle Management, Systemd Journal Auditing (`journalctl`), Database Data Directories, Linux File Ownership.
* **Technical Details:**
    * The service initialization was failing silently due to ownership drift on background directories. When the OS provisions services, the daemon user (e.g., `mysql`) must have explicit write access to both its PID tracking directory (`/run/mariadb`) and its persistent storage directory (`/var/lib/mysql`).
    * Repaired the crash by utilizing `chown -R mysql:mysql` across the affected paths and successfully brought the database state back to `active (running)`.
