#!/bin/bash

# Kill any existing processes on port 5000
lsof -ti:5000 | xargs kill -9 2>/dev/null || true

# Start the Python HTTP server
echo "Starting HTTP server on port 5000..."
python3 -m http.server 5000 &

# Wait for server to start
sleep 2

# Open the default browser
if [[ "$OSTYPE" == "darwin"* ]]; then
    open http://localhost:5000
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open http://localhost:5000
elif [[ "$OSTYPE" == "msys" ]]; then
    start http://localhost:5000
fi

echo "Server is running at http://localhost:5000"
echo "Press Ctrl+C to stop the server" 