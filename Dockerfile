FROM python:3.12-slim

WORKDIR /app

#COPY backend/requirements.txt ./requirements.txt
RUN pip install --upgrade pip

RUN apt-get update && \
    apt-get install -y gcc default-libmysqlclient-dev && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

COPY backend/ .

EXPOSE 8000
