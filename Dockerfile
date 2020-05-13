FROM alpine:3.5
WORKDIR flask-example
COPY requirements.txt /src/requirements.txt
RUN pip install -r requirements.txt
CMD ["python", "/src/app.py"]
