sudo docker stop python-web-server-staging
sudo docker rm python-web-server-staging
sudo docker run -d --network host --name python-web-server-staging python-web-server-$1
