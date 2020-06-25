# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :webserver,
  ecto_repos: [Webserver.Repo]

# Configures the endpoint
config :webserver, WebserverWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "einngkziuL7Heq56Cilmswk8sPFx5OSAbt8m5TzETwdvoFrLq8DqD3g9jptEi7Ap",
  render_errors: [view: WebserverWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Webserver.PubSub,
  live_view: [signing_salt: "RZvu+/ZV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
