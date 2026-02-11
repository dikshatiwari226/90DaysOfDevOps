** understand how Linux works under the hood **

1. Kernel (Core of Linux)

- The kernel is the brain of Linux.
- It manages CPU, memory, processes, devices, and file system.
- It talks directly to the hardware.

2. User Space

Where users and applications run.

- Commands like ls, cd, ps run here.
- These programs request services from the kernel - using system calls.

3. Process Management

- Every running program is a process.
- Linux schedules processes using CPU time sharing.
- Each process has a unique PID.

4. Memory Management

- Linux uses virtual memory.
- RAM + swap space.
- Isolates processes so they don’t interfere with each other.

5. File System

- Everything is treated as a file (even devices).
- Organized in a tree structure starting from / (root).

6. Shell

- The shell (bash, zsh) is the interface between user and kernel.
- You type commands → shell → kernel executes → returns output.

Simple Flow:

User → Shell → System Call → Kernel → Hardware → Response

In short: Linux is a kernel-based system that manages hardware resources and provides services to applications through system calls.
