FROM python:latest 

WORKDIR /app 

COPY . .  

EXPOSE 5000  

RUN pip3 install -r 

CMD ["python3", "app.py"]

RUN <<EOF
addgroup -S docker
adduser -S --shell /bin/bash --ingroup docker vscode
EOF
# install Docker tools (cli, buildx, compose)
