FROM python:3.4

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
    python-dnspython \
    python-argparse

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

WORKDIR /app

COPY . .

RUN python setup.py install

ENTRYPOINT ["/usr/local/bin/sublist3r"]