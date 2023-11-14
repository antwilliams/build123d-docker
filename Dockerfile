FROM python:3.10
LABEL org.opencontainers.image.source=https://github.com/antwilliams/build123d-docker
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN apt update && apt install -y libgl1-mesa-glx && \
apt-get clean && rm -rf /var/lib/apt/lists/*
COPY . .

CMD [ "python" ]