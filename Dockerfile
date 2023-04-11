FROM python:3.10-slim-bullseye


WORKDIR /app
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt
RUN apt update && apt install -y ffmpeg
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get install libxml2-dev libxslt-dev python

COPY . /app/

ENTRYPOINT [ "python3", "bot/gpt_telegram_bot.py" ]
