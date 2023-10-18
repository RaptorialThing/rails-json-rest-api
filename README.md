# README

[api usage](#api-usage)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### api usage

curl example

authentication
/login

request
```
curl -X POST -d '{"username": "nomads", "password": "nomads"}' \
-H 'Content-type: application/json' \
localhost:3000/login
```

response
```
{
  "user": {
    "id": 1,
    "username": "nomads",
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
curl -X GET  -H 'Content-type: application/json' \
-H 'Authorization: `bearer sldfj3423.sfsdf.sfksj`' \
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

