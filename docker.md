## install docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
## not need sudo:
    sudo usermod -aG docker ${USER}
    ls -l /var/run/docker.sock
    sudo chmod 660 /var/run/docker.sock
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
##### or
    docker run --name my-mysql-container -p 3306:3306 -e MYSQL_ROOT_PASSWORD=your_password -e MYSQL_ROOT_HOST='%' -d mysql --default-authentication-plugin=mysql_native_password

