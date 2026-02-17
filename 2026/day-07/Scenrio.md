### Day-07:- Part 2: Scenario-Based Practice

Scenario 1: Service Not Starting (myapp)
Problem: Service not starting after reboot

    Step1:- systemctl status myapp
    Why: Check if service is failed, inactive, or running

    Step2:- journalctl -u myapp -n 50
    Why: See recent error logs

    Step3:- systemctl is-enabled myapp
    Why: Check if it starts automatically on boot

    Step4:- systemctl restart myapp
    Why: Try restarting after checking logs

Scenario 2: High CPU Usage
Problem: Server is slow

    Step 1: top
    Why: See live CPU usage

    👉 Press q to exit

    Step 2: ps aux --sort=-%cpu | head -10
    Why: Show top CPU-consuming processes

    Step 3: Note the PID (Process ID)
    ps -p <PID> -o cmd
    Why: See which app is causing high CPU

✅ Learning: top → find process → investigate PID

Scenario 3: Finding Docker Service Logs
Problem: Developer wants Docker logs

    Step 1: systemctl status docker
    Why: Check if service is running

    Step 2: journalctl -u docker -n 50
    Why: Last 50 log lines

    Step 3 (Live logs): journalctl -u docker -f
    Why: Real-time logs (like tail -f)

✅ Learning: systemd service logs = journalctl

Scenario 4: Permission Denied Script
Problem: Script not executing

    Step 1: Check permissions
      ls -l /home/user/backup.sh
      Why: See if execute permission exists

    Step 2: Add execute permission
    chmod +x /home/user/backup.sh
    Why: Make script executable

    Step 3: Verify
    ls -l /home/user/backup.sh
    Why: Confirm x permission added

    Step 4: Run script
    ./backup.sh

✅ Learning: Permission denied = missing execute (x)

Final DevOps Mindset 🧠
When something breaks, think:

    Problem	            Check Here
    Service down	      systemctl status
    Errors	            journalctl
    Slow server	        top
    Script not running	Permissions
