# Use Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the entire project
COPY . .

# Expose Django default port
EXPOSE 8000

# Run development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
