FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Set the Python path to include the current directory
ENV PYTHONPATH=/app

# Change to the source directory if your app.py is in a subdirectory
#WORKDIR /app/source

# Verify the Python path and list directory contents
RUN python -c "import sys; print(sys.path)" && ls -R /app

# Update the CMD to use the correct module path
CMD ["gunicorn", "-b", "0.0.0.0:5000", "source.app:app"]