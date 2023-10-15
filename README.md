# README

[how to install](#how-to-install)
[api usage](#api-usage)


### how to install

#### Linux/Ubuntu
You need ruby, postgresql, git
[ruby, rbenv, rails](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)
[git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04)
[postgresql](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart)
clone api source code
```
git clone https://github.com/RaptorialThing/rails-json-rest-api.git 
```
install gems
```
bundle install
```
create postgresql database
```
rails db:create
```
create database tables
```
rails db:migrate
```
seed, fill tables with mock, test records
```
rails db:seed
```
Viola! that is it. now you can start server and play with api app
[api usage](#api-usage)

```
rails s
```

### api usage

curl example

authentication
/login

request
```
curl -X GET -d '{"username": "nomad", "password": "nomad"}' 
-H 'Content-type: application/json' 
localhost:3000/login
```

response
```
{
  "user": {
    "id": 1,
    "username": "nomad",
    "password_digest": "password_diggest",
    "age": 3,
    "created_at": "2023-10-14T13:26:40.750Z",
    "updated_at": "2023-10-14T13:26:40.750Z"
  },
  "token": "sfssdfs.sdfsdf.sdfsdfs"
}
```

check are you logged
/auto_login

request
```
curl -X GET  -H 'Content-type: application/json' 
-H 'Authorization: `bearer sldfj3423.sfsdf.sfksj`' 
localhost:3000/auto_login
```

response
```
{
  "id": 1,
  "username": "nomad",
  "password_digest": "password_digest",
  "age": 3,
  "created_at": "2023-10-14T13:26:40.750Z",
  "updated_at": "2023-10-14T13:26:40.750Z"
}

```
