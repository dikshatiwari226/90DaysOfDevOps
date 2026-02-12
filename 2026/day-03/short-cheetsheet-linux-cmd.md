# **Linux Command Cheat Sheet**

📁 1. **File & Directory Management**

    - pwd Show current working directory
    - ls List files and directories
    - ls -la List all files (including hidden) with details
    - cd <dir> Change directory
    - mkdir <dir> Create a new directory
      rmdir <dir> Remove empty directory
      rm <file> Delete a file
      rm -r <dir> Delete directory recursively
      cp <src> <dest> Copy files/directories
      mv <src> <dest> Move or rename file

📄 2. **File Viewing & Editing**

    cat <file> Display file content
    less <file> View file page by page
    head <file> Show first 10 lines
    tail <file> Show last 10 lines
    tail -f <file> Live monitor file (logs)
    nano <file> Edit file in nano editor
    vim <file> Edit file in vim editor

🔍 3. **Searching & Text Processing**

    grep "text" <file> Search for text in file
    grep -r "text" <dir> Search recursively in directory
    find <dir> -name file.txt Find file by name
    wc <file> Count lines, words, characters
    sort <file> Sort file content
    uniq <file> Remove duplicate lines
    cut -d "," -f1 <file> Extract column from file
    awk '{print $1}' <file> Print specific column

👤 4. **User & Permission Management**

    whoami Show current user
    who Show logged-in users
    chmod 755 <file> Change file permissions
    chown user:file <file> Change file ownership
    sudo <command> Run command as superuser

📊 5. **Process Management**

    ps Show running processes
    ps aux Show all running processes
    top Live system process monitor
    htop Interactive process viewer
    kill <pid> Terminate process by PID
    kill -9 <pid> Force kill process

🌐 6. **Networking Commands (Important)**

    ping <host> Check network connectivity
    ip addr Show IP address & network interfaces
    curl <url> Fetch data from URL
    dig <domain> DNS lookup information

✅ (Includes required networking commands)

💾 7. **Package Management (Ubuntu/Debian)**

    sudo apt update Update package list
    sudo apt upgrade Upgrade installed packages
    sudo apt install <pkg> Install package
    sudo apt remove <pkg> Remove package

📦 8. **Disk & System Info**

    df -h Show disk usage (human readable)
    du -sh <dir> Show directory size
    free -m Show memory usage
    uptime Show system uptime
    uname -a Show system information
