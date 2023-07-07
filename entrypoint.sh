#!/bin/bash
set -e

# Define the function to handle the SIGTERM signal
function sigterm_handler() {
  echo "SIGTERM received, shutting down gracefully..."
  # Execute any cleanup or shutdown tasks here

  # Stop the Flask application gracefully
  kill -TERM "$flask_pid"

  # Wait for the Flask application to exit
  wait "$flask_pid"
}

# Trap the SIGTERM signal and execute the signal handler
trap sigterm_handler TERM

# Start the Flask application in the background
python app.py &
flask_pid=$!

# Wait for the Flask application to finish
wait "$flask_pid"
