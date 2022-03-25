defmodule TextThem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TextThem.Repo,
      # Start the Telemetry supervisor
      TextThemWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TextThem.PubSub},
      # Start the Endpoint (http/https)
      TextThemWeb.Endpoint
      # Start a worker by calling: TextThem.Worker.start_link(arg)
      # {TextThem.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TextThem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TextThemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
