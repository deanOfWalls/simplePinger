# Use a Python base image
FROM python:3.8-slim

# Update package lists and install curl
RUN apt-get update && apt-get install -y curl

# Install Flask
RUN pip install Flask

# Set the working directory inside the container
WORKDIR /

# Copy the Python and Bash scripts to the container's working directory
COPY server.py .
COPY simplePinger.sh .

# Make the Bash script executable
RUN chmod +x simplePinger.sh

# Expose the port that the server will listen on
EXPOSE 8000

# Run the Bash script when the container starts
CMD ["./simplePinger.sh"]
