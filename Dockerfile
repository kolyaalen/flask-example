FROM pypy
WORKDIR flask-example
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . .
CMD ["python", "run.py"]
