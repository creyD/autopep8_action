FROM python:3

RUN pip install --no-cache-dir -q --upgrade pip
RUN pip install --no-cache-dir -q autopep8

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
