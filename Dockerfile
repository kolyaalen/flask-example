FROM alpine:3.5
WORKDIR flask-example
RUN sudo apt-get -y install python3-pip
RUN pip install -r requirements.txt
CMD ["python", "run.py"]
