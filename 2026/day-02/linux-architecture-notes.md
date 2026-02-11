# Day 02 – Linux Architecture, Processes, and systemd

## Task

# Q1) The core components of Linux (kernel, user space, init/systemd)?

1.  **Kernel**

- The core of Linux.
- Manages CPU, memory, processes, devices, - networking, and file systems.
- Applications interact with hardware through the kernel using system calls.

2.  **User Space**

- Where applications and users operate.
- Includes shell (bash), system libraries, utilities (ls, ps, top).
- User space programs request services from the kernel.

3.  **Init / systemd**

- The first process started by the kernel (PID 1).
- Responsible for starting and managing system services.
- Modern Linux uses systemd as the init system.

---

# Q2) How Processes Are Created & Managed

- Every running program is a process with a unique PID.
- Created using fork() → duplicates process.
- exec() → loads a new program into the process.
- Kernel scheduler allocates CPU time.
- Processes have states:
  - Running/ Sleeping/ Stopped/ Zombie

- **Key commands:**
  ps, top, htop/ kill/ nice / renice

# Q3) What systemd Does & Why It Matters

**What systemd Does:**

    - Starts services at boot
    - Manages background services (nginx, docker, ssh)
    - Handles logging (journald)
    - Controls service dependencies
    - Restarts failed services automatically

**Common Commands:**

    - systemctl start nginx
    - systemctl stop nginx
    - systemctl status nginx
    - journalctl -u nginx

** Why This Matters for DevOps **

Understanding this helps you:

- Troubleshoot service failures
- Debug high CPU/memory usage
- Fix boot issues
- Manage production servers confidently

** Mastering Linux internals = Strong DevOps foundation.**
