FROM quay.io/letsencrypt/letsencrypt

RUN apt-get update && apt-get install -y wget cron bc

RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/

ADD fetch_certs.sh /letsencrypt/
ADD save_certs.sh /letsencrypt/
ADD recreate_pods.sh /letsencrypt/
ADD refresh_certs.sh /letsencrypt/
ADD start.sh /letsencrypt/

WORKDIR /letsencrypt

EXPOSE 80

ENTRYPOINT ./start.sh
