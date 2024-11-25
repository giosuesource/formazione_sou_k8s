FROM python:latest 

WORKDIR /app 

COPY . .  

EXPOSE 5000  

RUN pip3 install -r 

#CMD ["gunicorn", "app:app"]  # Comando di avvio dell'applicazione con Gunicorn

ENTRYPOINT ["python3"]
CMD ["app.py"]
