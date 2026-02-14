# Day 04 – Linux Fundamentals (Hands-On): Processes and Services

To practice core Linux fundamentals by running real commands, observing system behavior, and understanding basic troubleshooting steps.

Q1)- Check running processes

    **ps aux | head -5**

    Observation: System processes are running under root.
    Shows user, PID, CPU usage, memory usage, and command name

- Check Specific Process
  **pgrep ssh**

  Observation: SSH service is running with PID 845.

  **top**

  Observation: Shows live system performance

  Helps identify high CPU or memory consuming processes.

  Why this matters: Used daily to monitor applications, detect stuck processes, and troubleshoot performance issues.

Q2)- Inspect one systemd service

    **Check Service Status**
    systemctl status ssh

    Observation: SSH service is active and running.

    **List Running Services**
    systemctl list-units --type=service --state=running\

    Observation: Multiple system services are running.

    **Check Service Logs**
    journalctl -u ssh --no-pager | tail -5

    O/P:-Accepted password for user from 192.168.1.10
    Observation: SSH login activity recorded.

    **View System Logs**
    tail -n 10 /var/log/syslog

    Observation: System logs show recent session activity.

Q3)- Capture a small troubleshooting flow

Scenario: SSH not working

1.  Check if process is running:
    pgrep ssh

2.  Check service status:
    systemctl status ssh

3.  If failed, restart:
    sudo systemctl restart ssh

4.  Check logs:
    journalctl -u ssh -n 20

- Processes can be checked using ps, pgrep
- Services are managed using systemctl
- Logs help identify real issues
- Troubleshooting follows a logical flow:
  **Process → Service → Logs → Restart**
