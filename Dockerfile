FROM alpine:3.5
WORKDIR flask-example
RUN pip install -r requirements.txt
CMD ["python", "run.py"]
