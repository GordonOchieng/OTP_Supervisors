defmodule Sequence2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, initial_number) do
    children = [
      { Sequence.Stash, initial_number},
      { Sequence.Server, nil},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Sequence2.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
