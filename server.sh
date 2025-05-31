#!/bin/bash

# Function to kill any existing server process
kill_server() {
    echo "Stopping any existing server..."
    pkill -f "python3 -m http.server" || true
    sleep 1
}

# Function to start the server
start_server() {
    echo "Starting server on port 8000..."
    python3 -m http.server 8000 &
    echo "Server started! Visit http://localhost:8000"
}

# Handle script termination
trap kill_server EXIT

# Main script
case "$1" in
    "start")
        kill_server
        start_server
        ;;
    "stop")
        kill_server
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

# Keep script running if started
if [ "$1" = "start" ]; then
    wait
fi 