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
