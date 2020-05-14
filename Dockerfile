FROM pypy
WORKDIR flask-example
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN apk add flask
COPY . .
CMD ["python", "run.py"]
