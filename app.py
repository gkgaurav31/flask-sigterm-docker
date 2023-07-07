import signal
from flask import Flask

app = Flask(__name__)

# Define a global variable to track if the server is running
running = True


def sigterm_handler(signum, frame):
    global running
    print("SIGTERM received, shutting down gracefully...")
    # Set the running flag to False to stop the server gracefully
    running = False


# Register the SIGTERM signal handler
signal.signal(signal.SIGTERM, sigterm_handler)


@app.route("/")
def hello():
    return "Hello, World!"


if __name__ == "__main__":
    app.run(host='0.0.0.0')

    # Check if the server is still running
    while running:
        pass

    # Perform any cleanup or shutdown tasks here
    print("Server stopped.")
