FROM pypy
WORKDIR flask-example
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update -y
RUN pip uninstall flask && python -m pip install flask
COPY . .
CMD ["python", "run.py"]
