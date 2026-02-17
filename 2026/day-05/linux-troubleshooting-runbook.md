# Day 05 – Linux Troubleshooting Drill: CPU, Memory, and Logs

🧾 Environment Basics

    1️⃣ Kernel Info
          uname -a
          Observation: Standard Linux kernel, no anomalies.

    2️⃣ OS Version
          cat /etc/os-release
          Observation: LTS release → stable production-like environment.

📁 Filesystem Sanity

    3️⃣ Create demo folder
          mkdir /tmp/runbook-demo
          Observation: Directory created successfully.

    4️⃣ Copy test file
          cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo
          Observation: Filesystem writable, permissions healthy

🧠 Snapshot: CPU & Memory

    5️⃣ Memory usage
          free -h
          Observation: No memory pressure.

    6️⃣ SSH process usage
          pgrep sshd
          ps -o pid,pcpu,pmem,comm -p <PID>
          Observation: sshd consuming negligible CPU/memory.

💾 Snapshot: Disk & IO

    7️⃣ Disk usage
        df -h
        Observation: Disk utilization normal (<80%).

    8️⃣ Log directory size
        du -sh /var/log
        Observation: Logs not bloated.

🌐 Snapshot: Network

    9️⃣ Check listening ports

        ss -tulpn | grep ssh
        Observation: SSH listening on port 22 as expected.

    🔟 Connectivity test
        ping -c 2 google.com
        Observation: Network connectivity working.

📜 Logs Reviewed

    1️⃣1️⃣ SSH service logs
          sudo journalctl -u ssh -n 50
          Observation: Successful login entries, no recent failures.

    1️⃣2️⃣ System logs

          tail -n 50 /var/log/auth.log
          Observation: Authentication logs normal, no brute-force attempts.

    <!-- ------------------------------ -->

      🚨 If This Worsens (Next Steps)
      1️⃣ Restart SSH safely
      sudo systemctl restart ssh
      sudo systemctl status ssh

      ⚠️ Ensure alternate access (console) before restarting remotely.

      2️⃣ Increase logging visibility
      sudo journalctl -u ssh -f

      Watch for:

      Failed logins

      Port binding issues

      3️⃣ Deep Debugging

      Check config:

      sudo sshd -t

      Inspect active sessions:

      who

      Trace process:

      sudo strace -p <sshd-pid>

      🧠 Interview-Ready Summary

      If asked:

      How do you troubleshoot SSH issues on Linux?

      Answer:

      I verify environment basics, ensure SSH is running, check CPU/memory and disk health, confirm port 22 is listening using ss, and analyze authentication logs using journalctl and /var/log/auth.log.
