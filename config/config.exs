# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :auth_service,
  ecto_repos: [AuthService.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :auth_service, AuthServiceWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: AuthServiceWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: AuthService.PubSub,
  live_view: [signing_salt: "37ZYhhmA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :auth_service, AuthServiceWeb.Auth.Guardian,
  issuer: "auth_service",
  secret_key: "9YL2RLM1EtjlxUHKaDvhfZ9dEsiA6RvVZlGifElu0JhP7X798nmhA3q3oKPOJQ+X"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
