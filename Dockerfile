# Base image with Python
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy the requirements.txt first to leverage Docker caching
COPY requirements.txt /app/

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . /app

# Expose the port used by the pillbox hardware (e.g., 5000)
EXPOSE 5000

# Command to run your Python hardware API
CMD ["python", "app.py"]  # Modify if your entry point file is different (e.g., `main.py`)