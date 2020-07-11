defmodule Webserver.Servers.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servers" do
    field :accepted, :integer
    field :blocked, :integer
    field :ip, :string
    field :name, :string
    field :online, :integer
    field :port, :integer
    field :uptime, :integer

    timestamps()
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:name, :ip, :port, :uptime, :online, :accepted, :blocked])
    |> validate_required([:name, :ip, :port, :uptime, :online, :accepted, :blocked])
  end
end
