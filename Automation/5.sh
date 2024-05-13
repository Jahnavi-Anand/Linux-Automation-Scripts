#!/bin/bash

# Function to check if web server is running
check_web_server() {
    # Command to check if the web server process is running
    if pgrep -x "apache2" >/dev/null; then
        return 0  # Web server is running
    else
        return 1  # Web server is not running
    fi
}

# Function to restart web server
restart_web_server() {
    echo "Web server is not running. Restarting..."
    systemctl restart apache2  
}

# Main loop for continuous monitoring
while true; do
    if ! check_web_server; then
        restart_web_server
    fi
    sleep 60  # Adjust the interval as needed (e.g., every 60 seconds)
done