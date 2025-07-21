# Use Python base image
FROM python:3.12-slim

# Set environment vars
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev \
    && apt-get clean

# Install Python dependencies
COPY backend/requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project
COPY backend/ .

# Port to expose (if running server here)
EXPOSE 8000

# Command to run
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
