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
Fields with "?" at the beginning are optional.

| Method | Path                  | Request JSON   | Headers   | Response 200      | Description                  |
|------|-------------------------|----------------|-----------|-------------------|------------------------------|
| POST | /api/accounts/create    | {</br>"account": {</br>&nbsp;&nbsp;&nbsp;"email": str,</br> &nbsp;&nbsp;&nbsp;"hash_password": str, </br>&nbsp;&nbsp;&nbsp;"?full_name": str, </br>&nbsp;&nbsp;&nbsp;"?gender": str, </br>&nbsp;&nbsp;&nbsp;"?biography": str}</br>} | -         | {</br>"id": str,</br>"token": str,</br>"email": str</br>} | Create new user.                |
| POST | /api/accounts/sign_in   | {</br>"email": str,</br> "hash_password": str</br>} | -         | {</br>"id": str,</br>"token": str,</br>"email": str</br>} | Log in as an existing user. |
| GET  | /api/accounts/current   | -              | Authorization: bearer JWT | Created user data | Get data about your current account. |
| GET  | /api/accounts/sign_out | -               | Authorization: bearer JWT | Updated user data | Log out of the account and delete the token. |
| GET  | /api/accounts/refresh_session | -        | Authorization: bearer JWT | -                 | Update token.            |
| POST | /api/accounts/update     | { "current_hash": str, ` - current password`</br> "account": {</br> "id": str,</br> "hash_password": str} ` - new password`</br> } | Authorization: bearer JWT | -                 | Update account information.            |
| PUT  | /api/users/update     | {</br>"user": { </br>&nbsp;&nbsp;&nbsp;"id": str, ` - its userId` </br>&nbsp;&nbsp;&nbsp;"?biography": str, </br>&nbsp;&nbsp;&nbsp;"?full_name":str, </br>&nbsp;&nbsp;&nbsp;"?gender": str} </br>} | Authorization: bearer JWT | -                 | Update user information.            |

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
```



