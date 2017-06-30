# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bouncy,
  ecto_repos: [Bouncy.Repo]

# Configures the endpoint
config :bouncy, Bouncy.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zyBmSHGEOnC1p2HyVMw4mPr+o5S6hra7OlyO8N70EhkBr03h6V8K7wYlSpP8J4wC",
  render_errors: [view: Bouncy.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bouncy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
