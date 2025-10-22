# Use lightweight Python image
FROM python:3.10-slim

# Set working dir inside container
WORKDIR /app

# Copy only requirements first (better for caching)
COPY requirements-dev.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements-dev.txt

# Copy the rest of the application
COPY src/api/ .

# Expose whichever port your app uses
# If Flask: 5000 | If FastAPI: 8000
EXPOSE 5000

# Run the service
CMD ["python", "main.py"]