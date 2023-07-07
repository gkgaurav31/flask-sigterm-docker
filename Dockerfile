# Use the official Python base image with version 3.9
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application directory into the container
COPY . .

# Expose the port on which the Flask application will run
EXPOSE 5000

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Define the entrypoint script as the entry point for the container
ENTRYPOINT ["/entrypoint.sh"]
