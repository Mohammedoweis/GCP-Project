FROM python:3.7
WORKDIR /app/python
COPY ./DevOps-Challenge-Demo-Code /app/python

ENV ENVIRONMENT=DEV
ENV PORT=8000

EXPOSE 8000
RUN pip install -r requirements.txt

ENTRYPOINT [ "python","hello.py"]	
