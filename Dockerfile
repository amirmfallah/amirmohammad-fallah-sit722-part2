# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set environment variables
ENV DATABASE_URL=${DATABASE_URL}

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file from the book_catalog directory into the container at /app
COPY book_catalog/requirements.txt /app/

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire book_catalog directory into the container at /app/book_catalog
COPY book_catalog /app/book_catalog

# Make port 80 available to the world outside this container
EXPOSE 80

# Set the command to run the FastAPI application using Uvicorn
CMD ["uvicorn", "book_catalog.main:app", "--host", "0.0.0.0", "--port", "80"]
