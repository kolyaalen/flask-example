FROM alpine:3.5
WORKDIR flask-example
COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
COPY app.py /src
COPY buzz /src/buzz
CMD ["python", "/src/app.py"]
