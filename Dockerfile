# Pull fro base image
FROM python:3.10.4-alpine3.15

# Maintainer
LABEL MAINTAINER="Abdulmumin Akinde"

# Set environment variable
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
# ENV PATH=/scripts:${PATH}

# Copy requirements file
COPY ./requirements.txt /requirements.txt

# Run some commands
RUN apk add --update --no-cache  --virtual .tmp gcc libc-dev linux-headers

RUN pip install -r /requirements.txt && \
    apk del .tmp && \
    mkdir /app

COPY ./app /app

WORKDIR /app

# COPY ./scripts /scripts

# RUN chmod +x /scripts/* && \
RUN adduser -D user

# RUN mkdir -p vol/web/media && \
    # mkdir -p  vol/web/ && \
    # chown -R user:user /vol && \
    # chmod -R 755 /vol/web

USER user

