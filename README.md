# inception
docker 42 project

- What's the goal of the project?


- What's the a Dockerfile?
Script-like text that contains instructions for generate a Docker image.
Example:
FROM python:3.8
COPY app.py /app/app.py
WORKDIR /app
RUN pip install flask
CMD ["python", "app.py"]

- What's a docker image?

