# Day 07 – Part2 (Scenario-Based Linux Practice)

✅ SOLVED EXAMPLE: Service Status Check
Question: How do you check if nginx is running?
bash# Step 1: Check status
systemctl status nginx

# Shows: active/inactive/failed

# Step 2: Check if auto-starts on boot

systemctl is-enabled nginx

# Shows: enabled/disabled

# Step 3: If issues, check logs

journalctl -u nginx -n 50

# Shows last 50 log lines

Interview Answer:
"I'd run systemctl status nginx to check if it's running, then journalctl -u nginx to see logs if there are errors."

📝 Scenario 1: Service Won't Start
Problem: Service 'myapp' failed after reboot
Interview Solution:
bash# 1. Check current status
systemctl status myapp

# Why: See if active/failed/inactive

# 2. View recent logs

journalctl -u myapp -n 50

# Why: Find error messages

# 3. Check if enabled on boot

systemctl is-enabled myapp

# Why: See if it auto-starts

# 4. Try to start it

sudo systemctl start myapp

# Why: Attempt to fix

# 5. If failed, watch logs live

journalctl -u myapp -f

# Why: See errors in real-time

Interview Answer Template:
"First, I'd check the service status with systemctl status myapp. Then I'd review the logs using journalctl -u myapp to identify the error. Finally, I'd verify it's enabled to start on boot with systemctl is-enabled myapp."
Common Errors to Mention:

Port already in use
Permission denied
Config file missing
Service not enabled

📝 Scenario 2: High CPU Usage
Problem: Server is slow, find which process is causing it
Interview Solution:
bash# 1. Check live CPU usage (best)
top

# Press 'P' to sort by CPU

# Press 'q' to quit

# 2. Get snapshot of top processes

ps aux --sort=-%cpu | head -10

# Shows top 10 CPU users

# 3. Check system load

uptime

# Shows: load average: 2.5, 2.1, 1.8

# 4. Kill process if needed (note PID from top)

kill 1234

# Or force kill: kill -9 1234

Interview Answer Template:
"I'd use top to see which process is consuming CPU in real-time. Then I'd note the PID and use ps -p <PID> for details. If it's a runaway process, I'd kill it with kill <PID>."
Key Points to Mention:

top shows real-time usage
Look at %CPU column
Note the PID (Process ID)
Load average should be < number of CPU cores

📝 Scenario 3: Finding Service Logs
Problem: Developer asks "Where are docker logs?"
Interview Solution:
bash# 1. Check service status (shows recent logs)
systemctl status docker

# 2. View last 50 lines

journalctl -u docker -n 50

# 3. Follow logs in real-time

journalctl -u docker -f

# 4. Search for errors

journalctl -u docker | grep -i error

# 5. Logs from specific time

journalctl -u docker --since "1 hour ago"
Interview Answer Template:
"For systemd services, logs are in journald. I'd use journalctl -u docker -n 50 to see recent logs, or journalctl -u docker -f to follow them in real-time."
Key Commands to Remember:

journalctl -u <service> = view logs
-n 50 = last 50 lines
-f = follow (live)
--since "1 hour ago" = time filter

📝 Scenario 4: Permission Denied
Problem: Script won't execute - "Permission denied"
Interview Solution:
bash# 1. Check current permissions
ls -l /home/user/backup.sh

# Look for: -rw-r--r-- (no 'x')

# 2. Add execute permission

chmod +x /home/user/backup.sh

# 3. Verify it worked

ls -l /home/user/backup.sh

# Look for: -rwxr-xr-x (has 'x')

# 4. Run the script

./backup.sh

```

**Interview Answer Template:**
"I'd first check permissions with `ls -l`. If there's no execute permission (no 'x'), I'd add it with `chmod +x script.sh`, then verify with `ls -l` again."

**Permission Quick Reference:**
```

-rwxr-xr-x
|||
||└─ Execute
|└── Write
└─── Read

chmod +x = Add execute for all
chmod 755 = rwxr-xr-x (owner full, others read+execute)
chmod 644 = rw-r--r-- (owner read+write, others read)

🔥 Interview Cheat Sheet
Service Management
bashsystemctl status <service> # Check status
systemctl start <service> # Start service
systemctl stop <service> # Stop service
systemctl restart <service> # Restart service
systemctl enable <service> # Enable on boot
systemctl is-enabled <service> # Check if enabled
Log Analysis
bashjournalctl -u <service> # View service logs
journalctl -u <service> -n 50 # Last 50 lines
journalctl -u <service> -f # Follow live
journalctl --since "1 hour ago" # Time-based filter
tail -f /var/log/syslog # Traditional logs
Process & Performance
bashtop # Live process monitor
ps aux --sort=-%cpu | head # Top CPU processes
ps aux --sort=-%mem | head # Top memory processes
kill <PID> # Stop process
kill -9 <PID> # Force kill
uptime # System load
free -h # Memory usage
df -h # Disk usage
File Permissions
bashls -l <file> # View permissions
chmod +x <file> # Add execute
chmod 755 <file> # rwxr-xr-x
chmod 644 <file> # rw-r--r--
chown user:group <file> # Change owner
Finding Files & Logs
bashfind / -name "filename" # Find file by name
find / -size +100M # Find large files
du -sh /var/log/\* # Directory sizes
grep "error" /var/log/syslog # Search in logs

```

---

## 💡 Interview Tips

### What Interviewers Want to Hear:

**❌ Bad Answer:**
"I'd restart the server."

**✅ Good Answer:**
"I'd first check the service status with `systemctl status`, then review logs with `journalctl` to identify the root cause before taking action."

### Troubleshooting Flow to Mention:

1. **Identify** - What's the symptom?
2. **Investigate** - Check status, logs, resources
3. **Diagnose** - Find root cause
4. **Fix** - Apply solution
5. **Verify** - Confirm it works
6. **Document** - Note what happened

### Common Interview Scenarios:

**Q: "Service is down, what do you do?"**
```

1. Check status: systemctl status <service>
2. Check logs: journalctl -u <service>
3. Check ports: netstat -tulpn | grep <port>
4. Restart: systemctl restart <service>

```

**Q: "Server is slow, how do you debug?"**
```

1. Check load: uptime
2. Check CPU: top
3. Check memory: free -h
4. Check disk: df -h
5. Check processes: ps aux --sort=-%cpu

```

**Q: "How do you find what's filling disk?"**
```

1. Check overall: df -h
2. Find large dirs: du -sh /\* | sort -h
3. Check logs: du -sh /var/log/\*
4. Find large files: find / -size +100M

```

**Q: "User can't login via SSH, troubleshoot?"**
```

1. Check SSH service: systemctl status sshd
2. Check auth logs: tail /var/log/auth.log
3. Check user exists: cat /etc/passwd | grep username
4. Check SSH config: cat /etc/ssh/sshd_config
5. Check firewall: ufw status

🎯 Quick Memory Aids
For Services: S-L-E

Status (systemctl status)
Logs (journalctl -u)
Enabled (systemctl is-enabled)

For Performance: T-P-F-D

Top (CPU/processes)
Ps (process list)
Free (memory)
Df (disk)

For Permissions: Remember 755 & 644

755 = Scripts (executable)
644 = Files (not executable)

For Logs: N-F-S

N (lines): -n 50
F (follow): -f
S (since): --since "1 hour ago"

📌 Final Interview Checklist
Before any interview, know these by heart:
✅ How to check service status
✅ How to view logs (journalctl)
✅ How to find high CPU process (top)
✅ How to fix permissions (chmod)
✅ How to check disk space (df -h)
✅ How to search in logs (grep)
✅ Common locations: /etc, /var/log, /home
Practice saying these commands out loud!

🚀 One-Liner Interview Answers
Q: How to check if service is running?
A: systemctl status <service>
Q: How to view service logs?
A: journalctl -u <service> -n 50
Q: How to find high CPU process?
A: top or ps aux --sort=-%cpu | head
Q: How to make file executable?
A: chmod +x filename
Q: How to check disk space?
A: df -h
Q: How to find large files?
A: du -sh /\* | sort -h | tail -10
Q: Where are system logs?
A: /var/log/ directory
Q: Where are config files?
A: /etc/ directory
