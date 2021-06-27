# A more complex setup: A Laravel & PHP Dockerized Project

Practice Images, Containers, and Compose with a concrete example.

## Target Setup

Target Setup: 
* Source Code
* PHP Interpreter (App Container)
* Nginx Web Server (App Container)
* MySQL Database (App Container)
* Composer (Utility Container)
* Laravel Artisan (Utility Container)
* npm (Utility Container)

## Creating a Laravel App via Composer Container

```shell
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```

## Launching only some Docker compose services

```shell
docker-compose up -d server php mysql
```

To force rebuild if required:
```shell
docker-compose up -d --build server php mysql
```

### Adding more utility containers

```shell
docker-compose run --rm artisan migrate 
```
