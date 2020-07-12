defmodule Webserver.Servers.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servers" do
    field :accepted, :integer
    field :blocked, :integer
    field :ip, :string
    field :name, :string
    field :online, :integer
    field :uptime, :integer

    timestamps()
  end

  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:name, :ip, :uptime, :online, :accepted, :blocked])
    |> validate_required([:name, :ip])
  end
end
