# AuthService

To start Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Visit [`localhost:4000`](http://localhost:4000).

## Start Postgres Database with docker

``` bash
$ chmod +x docker_postgres_start.sh && ./docker_postgres_start.sh
```

# API Routes
Each path must have an "api" scope at the beginning.

Fields with "?" at the beginning are optional.

| Method | Path                  | Request JSON   | Headers   | Response 200      | Description                  |
|------|-------------------------|----------------|-----------|-------------------|------------------------------|
| POST | /accounts/create    | {</br>"account": {</br>&nbsp;&nbsp;&nbsp;"email": str,</br> &nbsp;&nbsp;&nbsp;"hash_password": str, </br>&nbsp;&nbsp;&nbsp;"?full_name": str, </br>&nbsp;&nbsp;&nbsp;"?gender": str, </br>&nbsp;&nbsp;&nbsp;"?biography": str}</br>} | -         | {</br>"id": str,</br>"token": str,</br>"email": str</br>} | Create new user.                |
| POST | /accounts/sign_in   | {</br>"email": str,</br> "hash_password": str</br>} | -         | {</br>"id": str,</br>"token": str,</br>"email": str</br>} | Log in as an existing user. |
| GET  | /accounts/current   | -              | Authorization: JWT | - | Get data about your current account. |
| GET  | /accounts/sign_out | - | Authorization: JWT | {</br>"id": str, </br>"token": null, </br>"email": str</br>} | Delete the token. |
| GET  | /accounts/refresh_session | -        | Authorization: JWT | {</br>"id": str, </br>"token": str, </br>"email": str </br>} | Return new token and delete old|
| POST | /accounts/update     | { "current_hash": str,</br> "account": {</br> "id": str,</br> "hash_password": str} ` - new password`</br> } | Authorization: JWT | -                 | Update account information.            |
| PUT  | /users/update     | {</br>"user": { </br>&nbsp;&nbsp;&nbsp;"id": str, ` - userId` </br>&nbsp;&nbsp;&nbsp;"?biography": str, </br>&nbsp;&nbsp;&nbsp;"?full_name":str, </br>&nbsp;&nbsp;&nbsp;"?gender": str} </br>} | Authorization: JWT | -                 | Update user information.            |

## Additional commands for Elixir + Phoenix

``` bash
# Used to load and install project dependencies specified in the "mix.exs".
$ mix deps.get

# Starts the Phoenix web server.
$ mix phx.server

# Runs tests.
$ mix test

# Used to create the database specified in the Ecto configuration file.
$ mix ecto.create

# Applies all migrations to the database.
$ mix ecto.migrate

# Rolls back the last migration, returning the database to its previous state.
$ mix ecto.rollback

# Preparing the database for tests.
$ MIX_ENV=test mix ecto.drop
$ MIX_ENV=test mix ecto.create
$ MIX_ENV=test mix ecto.migrate
```



