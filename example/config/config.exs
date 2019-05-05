# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :beeper,
  ecto_repos: [Beeper.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :beeper, BeeperWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iIZsTVkRKeEfBTRLXT08SYpbczGaKwvjp4AFVg6PcBjrRJBPmIFpA66e9x5YbJya",
  render_errors: [view: BeeperWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Beeper.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Beeper.Coherence.User,
  repo: Beeper.Repo,
  module: Beeper,
  web_module: BeeperWeb,
  router: BeeperWeb.Router,
  password_hashing_alg: Comeonin.Bcrypt,
  messages_backend: BeeperWeb.Coherence.Messages,
  registration_permitted_attributes: [
    "email",
    "name",
    "password",
    "current_password",
    "password_confirmation"
  ],
  invitation_permitted_attributes: ["name", "email"],
  password_reset_permitted_attributes: [
    "reset_password_token",
    "password",
    "password_confirmation"
  ],
  session_permitted_attributes: ["remember", "email", "password"],
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :trackable, :unlockable_with_token, :registerable],
  user_token: true

config :coherence, BeeperWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"

# %% End Coherence Configuration %%
