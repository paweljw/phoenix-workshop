defmodule Beeper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Beeper.Repo,
      # Start the endpoint when the application starts
      BeeperWeb.Endpoint
      # Starts a worker by calling: Beeper.Worker.start_link(arg)
      # {Beeper.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Beeper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BeeperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
