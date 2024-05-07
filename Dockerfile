FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app


# Install any dependencies specified in requirements.txt
RUN pip install Flask

# Copy the rest of the application code into the container at /app
COPY . /app/

# Expose port 5000 for the Flask application
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]

