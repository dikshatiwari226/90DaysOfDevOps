# Day 03 – Linux Commands Practice (Daily-Use Cheat Sheet)

1.  **Process Management**

Command Usage Why to use

--View Processes:-

1. **ps aux** – Shows all running processes.
2. **ps -ef** – Displays all processes in full format.
3. **top** – Shows live CPU and memory usage.
4. **htop** – Interactive process monitoring tool.

   --Find Specific Process:-

5. ps aux | grep nginx – Finds nginx process manually.
6. pgrep nginx – Gets PID of nginx quickly.

   --Kill Process:-

7. kill <PID> – Stops a process gracefully.
8. kill -9 <PID> – Force kills a process.
9. pkill nginx – Kills process by name.

   --Process Priority

10. nice -n 10 command – Runs command with lower priority.
11. renice 5 <PID> – Changes priority of running process.

--Check Resource Usage:-

12. top – Monitors system resource usage live.
13. htop – Interactive system monitoring.
14. free -m – Shows memory usage in MB.
15. uptime – Shows system uptime and load average.

2- **File System Commands**

📂 Navigation

pwd – Shows current directory path.
ls -l – Lists files with detailed information.
ls -la – Lists all files including hidden ones.
cd /path – Changes directory to given path.

📄 File Operations

touch file.txt – Creates an empty file.
cp file1 file2 – Copies file1 to file2.
mv old new – Moves or renames a file.
rm file.txt – Deletes a file.
rm -rf folder/ – Force deletes a folder and its contents.

📁 Directory Operations

mkdir dir – Creates a new directory.
rmdir dir – Deletes an empty directory.

🔎 Find Files

find / -name file.txt – Searches file from root directory.
locate file.txt – Quickly finds file using database.

🔐 Permissions

chmod 755 file – Changes file permissions.
chown user:group file – Changes file owner and group.

💾 Disk Usage

df -h – Shows disk space usage in human-readable format.
du -sh folder/ – Shows folder size.

3.  **Networking & Troubleshooting**

Check IP:-

- ip a – Shows IP addresses and network interfaces.
- hostname -I – Displays system IP address.

Test Connectivity:-

- ping google.com – Checks network connectivity to a host.

Check Open Ports:-

- netstat -tulnp – Shows open ports and listening services.
- ss -tulnp – Displays active ports and services (faster than netstat).

Check DNS:-

- nslookup google.com – Checks DNS resolution for a domain.
- dig google.com – Provides detailed DNS query information.

Check Listening Services:-

- lsof -i :80 – Shows which process is using port 80.

Test HTTP Service:-

- curl http://localhost:80 – Tests HTTP response from a server.
- wget http://example.com – Downloads content from a URL.

🧠 DevOps Pro Tip
When something breaks in production, ask:

Is the process running? → ps, top
Is disk full? → df -h
Is port open? → ss -tulnp
Is service reachable? → curl
Is DNS working? → nslookup
