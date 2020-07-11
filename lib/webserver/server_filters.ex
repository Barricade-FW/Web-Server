defmodule Webserver.ServerFilters do
  use Ecto.Schema
  import Ecto.Changeset

  schema "serverfilters" do
    field :filterid, :integer
    field :serverid, :integer

    timestamps()
  end

  @doc false
  def changeset(server_filters, attrs) do
    server_filters
    |> cast(attrs, [:filterid, :serverid])
    |> validate_required([:filterid, :serverid])
  end
end
