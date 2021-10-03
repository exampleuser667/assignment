sudo docker stop python-web-server-staging
sudo docker rm python-web-server-staging
sudo docker stop python-web-server-production
sudo docker rm python-web-server-production
sudo docker run -d --network host --name python-web-server-production python-web-server-$1
