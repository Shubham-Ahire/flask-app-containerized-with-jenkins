# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the local application files to the container
COPY . /app

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 (the default port Flask runs on)
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
