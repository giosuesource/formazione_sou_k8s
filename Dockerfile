FROM python:3.9

WORKDIR /app 

COPY . .  

COPY requirements.txt /app

RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

ENTRYPOINT ["python3"]

CMD ["app.py"]

EXPOSE 5000  

