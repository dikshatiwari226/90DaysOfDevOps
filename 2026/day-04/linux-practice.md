# Day 04 – Linux Fundamentals (Hands-On): Processes and Services

🔎 1. Process Checks
✅ Command 1: Check running processes

    ps aux | head
    👉 Shows currently running processes.

✅ Command 2: Find specific process

    pgrep ssh
    👉 Confirms ssh service process is running.

✅ Command 3: Live process monitoring

    top
    👉 Real-time CPU & memory usage.

⚙️ 2. Service Checks (Using ssh service)

✅ Command 4: Check service status

    sudo systemctl status ssh
    👉 Confirms service is active.

✅ Command 5: List all running services

    systemctl list-units --type=service --state=running

    Output (sample):

    cron.service        loaded active running
    ssh.service         loaded active running
    systemd-journald.service loaded active running
    👉 Shows all active services.

📜 3. Log Checks

✅ Command 6: View last 50 lines of system log

    sudo journalctl -u ssh -n 50
    👉 Shows recent ssh activity.

✅ Command 7: Monitor logs live

    sudo journalctl -u cron -f
    👉 Live monitoring for troubleshooting.

✅ Command 8: Check generic log file

    tail -n 50 /var/log/syslog
    👉 Shows last 50 log entries.

🛠 Mini Troubleshooting Practice

    Scenario: Cron job not running

    Step 1: Check if process exists
      pgrep cron

    Step 2: Check service status
      sudo systemctl status cron

    If inactive:
      sudo systemctl start cron

    Step 3: Check logs for errors
      sudo journalctl -u cron -n 20

    Step 4: Verify cron jobs
      crontab -l
