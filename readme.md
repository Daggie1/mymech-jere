

## My Mechanic

Garage service booking web app 
## Requirements
- php 7.3 ->[download and install xampp 7.3.25](https://www.apachefriends.org/download.html)
- Mysql
- Composer [download and install latest version](https://getcomposer.org/download/)

## Running Locally
- create db
- copy file "env.example" paste and rename it .env
- add db configs on your .env
- import your db from "db/mymech"
- install dependencies ==  *composer install*
- generate application key ==  *php artisan key:gen*
- run app server ==  *php artisan serve*
