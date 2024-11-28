FROM python:latest 

WORKDIR /app 

COPY . .  

EXPOSE 5000  

ENTRYPOINT ["python3"]

CMD ["app.py"]
