FROM public.ecr.aws/lambda/python:3.12
# FROM python:3.9-slim

ENV NUMBA_CACHE_DIR=/tmp
ENV XDG_CACHE_HOME=/tmp
# Install Poppler utilities
RUN dnf -y update && dnf -y install poppler-utils && dnf clean all
# RUN apt-get update && apt-get install -y poppler-utils

# RUN yum -y update && yum -y install poppler-utils
COPY requirements.txt requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY . .

CMD ["app.lambda_handler"]
# ENV PYTHONUNBUFFERED=1
# CMD ["python", "-u", "app.py"]
