## install docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
## docker config proxy (if any)
#### step 1:
    sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf
#### step 2: in file
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:8080/"
#### step 3:
    sudo systemctl daemon-reload
    sudo systemctl restart docker
## drop all container
    docker container prune --force
## drop all images
    docker image prune --all --force
## show all container
    docker ps -a
## show all images
    docker images
## set up mysql
#### mysql pull
        docker pull mysql:8.0
#### mysql config
        docker run -d --name my-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -p 3307:3306 mysql:8.0
3307 is port in this pc, 3306 is port in container
