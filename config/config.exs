# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_trial,
  ecto_repos: [ApiTrial.Repo]

# Configures the endpoint
config :api_trial, ApiTrialWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lH3lnRkro33LE7q1gwnSaHeVyyPjxThCPNvnI6Yz/1HWwfpBqi8cRTi/lPFdDpsM",
  render_errors: [view: ApiTrialWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ApiTrial.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
