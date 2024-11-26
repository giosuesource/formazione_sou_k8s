FROM python:latest 

WORKDIR /app 

COPY . .  

EXPOSE 5000  

RUN pip3 install -r 

CMD ["python3", "app.py"]
