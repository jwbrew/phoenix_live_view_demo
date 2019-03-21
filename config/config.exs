# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_liveview,
  ecto_repos: [PhoenixLiveview.Repo]

# Configures the endpoint
config :phoenix_liveview, PhoenixLiveviewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/HjU6KQVpKwoqSJQ6AJho/7rgAL4Sj2QXWvmLKF1kSUHrYt56g04q3TG2OF9kmXY",
  render_errors: [view: PhoenixLiveviewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixLiveview.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "6HKEaTQU4LzYeIqiPa7GXYWF7NEexxpG"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
