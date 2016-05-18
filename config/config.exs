# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :my_turn, MyTurn.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "N+KJ1GGNcExfQ8FbO5D9Ermi41qFUNrxAlzBJJV2lq/p30+IWPLMAF/3+m1Fu1RM",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: MyTurn.PubSub,
           adapter: Phoenix.PubSub.PG2]
config :guardian, Guardian,
  issuer: "MyTurn",
  ttl: { 30, :days},
  secret_key: "ESOHGOGOHVEOoehgoaihrg",
  serializer: MyApp.GuardianSerializer

config :ueberauth, Ueberauth,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"]
      ]},
    github: {Ueberauth.Strategy.Github, []}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
  
config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
