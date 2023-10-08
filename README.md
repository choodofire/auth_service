# AuthService

To start Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Visit [`localhost:4000`](http://localhost:4000).

## Docker
``` bash
$ docker-compose up --build
```

## Start Postgres Database with docker

``` bash
$ chmod +x docker_postgres_start.sh && ./docker_postgres_start.sh
```

# API Routes
Each path must have an "api" scope at the beginning.

Fields with "?" at the beginning are optional.

Types of Fields:
- `email`: str;
- `hash_password`: str;
- `full_name`, `gender`, `biography`: str || null;
- `id`: str;
- `token`: str || null;
- `current_hash`: str. Its current password of account;

The authorisation token is represented in the JWT Bearer format.

| Method | Path                  | Request JSON   | Headers   | Response 200      | Description                  |
|------|-------------------------|----------------|-----------|-------------------|------------------------------|
| POST | /accounts/create    | {</br>"account": {</br>&nbsp;&nbsp;&nbsp;"email",</br> &nbsp;&nbsp;&nbsp;"hash_password", </br>&nbsp;&nbsp;&nbsp;"?full_name", </br>&nbsp;&nbsp;&nbsp;"?gender", </br>&nbsp;&nbsp;&nbsp;"?biography"}</br>} | -         | {</br>"id",</br>"token",</br>"email"</br>} | Create new user.                |
| POST | /accounts/sign_in   | {</br>"email",</br> "hash_password"</br>} | -         | {</br>"id",</br>"token",</br>"email"</br>} | Log in as an existing user. |
| GET  | /accounts/current   | -              | Auth | {</br>"id",</br>"email",</br>"user":{</br>"id",</br>"biography",</br>"gender",</br>"full_name"}</br>} | Get data about your current account. |
| GET  | /accounts/sign_out | - | Auth | {</br>"id", </br>"token": null, </br>"email"</br>} | Delete the token. |
| GET  | /accounts/refresh_session | -        | Auth | {</br>"id", </br>"token", </br>"email"</br>} | Return new token and delete old|
| POST | /accounts/update     | { "current_hash,</br> "account": {</br> "id",</br> "hash_password"} ` - new pass`</br> } | Auth| {</br>"data":{</br>"id", </br>"hash_password", </br>"email"}</br>}                 | Update account information.            |
| PUT  | /users/update     | {</br>"user": { </br>&nbsp;&nbsp;&nbsp;"id", ` - userId` </br>&nbsp;&nbsp;&nbsp;"?biography", </br>&nbsp;&nbsp;&nbsp;"?full_name", </br>&nbsp;&nbsp;&nbsp;"?gender"} </br>} | Auth | {</br>"data":{</br>"id",</br>"biography",</br>"full_name",</br>"gender"}</br>} | Update user information.            |

## Additional commands for Elixir + Phoenix

``` bash
# Used to load and install project dependencies specified in the "mix.exs".
$ mix deps.get

# Used to create the database specified in the Ecto configuration file.
$ mix ecto.create

# Applies all migrations to the database.
$ mix ecto.migrate

# Rolls back the last migration, returning the database to its previous state.
$ mix ecto.rollback

# Starts the Phoenix web server.
$ mix phx.server

# Runs tests.
$ mix test

# Preparing the database for tests.
$ MIX_ENV=test mix ecto.drop
$ MIX_ENV=test mix ecto.create
$ MIX_ENV=test mix ecto.migrate
```



