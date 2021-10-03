sudo docker stop python-web-server-staging
sudo docker rm python-web-server-staging
sudo docker run -d --network host --name python-web-server-$1-staging python-web-server-staging
