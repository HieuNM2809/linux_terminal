# +) Env:
    - setting git mypt:
        MYSQL_DATABASE_HOST="mysql-db-host"
        MYSQL_DATABASE_USER="mysql-db-username"
        MYSQL_DATABASE_PASSWORD="mysql-db-password"
        MYSQL_DATABASE_DB="mysql-db-name"
        MYSQL_DATABASE_PORT="mysql-db-port"

        CENTRALIZED_SESSION_REDIS_HOST=redis-cache
        CENTRALIZED_SESSION_REDIS_PORT=6379
        CENTRALIZED_SESSION_REDIS_PASSWORD=
        CENTRALIZED_SESSION_REDIS_DATABASE=15

        USE_PRODUCTION=0

        APP_ENV=app-env
    - setting local mypt:
        MYSQL_DATABASE_HOST=127.0.0.1
        MYSQL_DATABASE_USER=root
        MYSQL_DATABASE_PASSWORD=fam@N2
        MYSQL_DATABASE_DB=mytin_pnc
        MYSQL_DATABASE_PORT=3306

        CENTRALIZED_SESSION_REDIS_HOST=127.0.0.1
        CENTRALIZED_SESSION_REDIS_PORT=6379
        CENTRALIZED_SESSION_REDIS_PASSWORD=
        CENTRALIZED_SESSION_REDIS_DATABASE=15

        USE_PRODUCTION=0

        APP_ENV=local

# +) Terminal setup project:
    - check git:
        git branch
        git checkout dev
        git pull
    - create and config venv:
        python3 -m venv venv
        python3 -m pip install --upgrade pip
        pip install -r requirements.txt
    - choose environments venv:venv

# +) Extension install mypt:
    - python extension
    - gitlens

# +) Tool install:
    - redis-server
    - redis-desktop-manage
    - mysql-server
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'insert_password';
    - heidisql
    - visual studio code
    - postman
    - openvpn:
        sudo apt-get install openvpn
        network-manager-openvpn
        network-manager-openvpn-gnome
