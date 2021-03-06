require Bottler.Helpers, as: H
alias Bottler, as: B

defmodule Mix.Tasks.Bottler.Install do

  @moduledoc """
    Install a shipped file on configured remote servers.
    Use like `mix bottler.install`.

    `prod` environment is used by default. Use like
    `MIX_ENV=other_env mix bottler.install` to force it to `other_env`.
  """

  use Mix.Task

  def run(args) do
    {switches, _} = H.parse_args!(args)

    H.set_prod_environment
    c = H.read_and_validate_config |> H.inline_resolve_servers(switches)
    {:ok, _} = B.install c
    :ok
  end

end
