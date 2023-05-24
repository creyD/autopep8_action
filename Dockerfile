FROM python:3.11.3-slim-bullseye

RUN apt update && apt install -y --no-install-recommends git

RUN pip install --no-cache-dir -q --upgrade pip
RUN pip install --no-cache-dir -q autopep8

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
