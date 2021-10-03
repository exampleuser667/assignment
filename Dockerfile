FROM ubuntu:18.04
WORKDIR /
RUN apt update \ 
&& apt install -y python3
ADD ./web-server.py /web-server.py
ADD ./start.sh /start.sh
ENTRYPOINT ["/bin/bash","/start.sh"]
