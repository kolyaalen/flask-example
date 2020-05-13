FROM python:3
WORKDIR flask-example
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "run.py"]
