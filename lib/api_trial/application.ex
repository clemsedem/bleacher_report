defmodule ApiTrial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
     import Supervisor.Spec
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      ApiTrial.Repo,
      # Start the endpoint when the application starts
      ApiTrialWeb.Endpoint,
      worker(Cachex, [ :my_cache, [] ])
      
      # Starts a worker by calling: ApiTrial.Worker.start_link(arg)
      # {ApiTrial.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one,  name: ApiTrial.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ApiTrialWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
