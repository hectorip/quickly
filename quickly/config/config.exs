# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :quickly,
  ecto_repos: [Quickly.Repo]

# Configures the endpoint
config :quickly, Quickly.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6Hbl0VVCd6ois7vzAJFGzCaUjW9EuvBY+4WTjxXNkYKWGUb+nYAdLDmFbHyc87ks",
  render_errors: [view: Quickly.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Quickly.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# config :guardian, Guardian,
#   issuer: "Quickly",
#   ttl: { 30, :days },
#   verify_issuer: true,
#   # secret_key: JOSE.JWK.generate_key(16),
#   serializer: Quickly.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
