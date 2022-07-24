FROM tiangolo/uwsgi-nginx-flask:python3.8

ENV NGINX_WORKER_PROCESSES auto

ENV UWSGI_CHEAPER 4
ENV UWSGI_PROCESSES 64

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -o Dpkg::Options::='--force-confmiss' install --reinstall -y netbase
ENV STATIC_URL /app/static

ENV STATIC_INDEX /app/templates/index.html

COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./ /app

# define the port number the container should expose
EXPOSE 8000

# run the command
CMD ["./entrypoint.sh"]
