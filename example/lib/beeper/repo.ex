defmodule Beeper.Repo do
  use Ecto.Repo,
    otp_app: :beeper,
    adapter: Ecto.Adapters.Postgres
end
