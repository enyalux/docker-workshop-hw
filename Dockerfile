FROM python:3.11-slim-buster 

WORKDIR /app

EXPOSE 5000
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1

COPY . .

CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]