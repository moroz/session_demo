# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :session_demo,
  ecto_repos: [SessionDemo.Repo]

# Configures the endpoint
config :session_demo, SessionDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4ePaRUOhMagTUaCT+qlLLUueppveXsK3tN7PAnD0SWkR6YZQ5QJIeiOShkhUawZc",
  render_errors: [view: SessionDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SessionDemo.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "xvE0kDFz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
