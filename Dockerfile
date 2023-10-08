FROM elixir:1.15

WORKDIR /app

RUN apt-get update && \
    apt-get install -y postgresql-client

COPY . /app

# Install hex and rebar3
RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix deps.get

EXPOSE 4000

ENV MIX_ENV=dev

RUN mix compile

CMD ["sh", "-c", "mix ecto.create && mix ecto.migrate && DATABASE_URL=ecto://postgres:root@bs_db/auth_service_dev mix phx.server"]
