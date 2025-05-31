#!/bin/bash

# Kill any existing processes on port 5500 (Live Server's default port)
lsof -ti:5500 | xargs kill -9 2>/dev/null || true

# Open VS Code with the index.html file
code --new-window index.html

echo "Live Server is starting..."
echo "1. Press Cmd+Shift+P (on Mac)"
echo "2. Type 'Live Server: Open with Live Server'"
echo "3. Press Enter"
echo "Your website will open in your default browser at http://127.0.0.1:5500" 