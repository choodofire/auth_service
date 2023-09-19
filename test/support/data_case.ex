defmodule AuthService.Support.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ecto.Changeset
      import AuthService.Support.DataCase
      alias AuthService.{Support.Factory, Repo}
    end
  end

  setup _ do
    Ecto.Adapters.SQL.Sandbox.mode(AuthService.Repo, :manual)
  end
end
