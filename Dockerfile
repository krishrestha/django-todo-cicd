# Use a Python base image
FROM python:3.8

# Set a working directory inside the container
WORKDIR /app

# Install required system packages (like distutils)
RUN apt-get update && apt-get install -y python3-distutils

# Install Django 3.2
RUN pip install django==3.2

# Copy the current directory contents into the container at /app
COPY . .

# Run database migrations
RUN python3 manage.py migrate

# Expose the port the app will run on
EXPOSE 8001

# Start the Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8001"]

