defmodule Webserver.Repo.Migrations.CreateServers do
  use Ecto.Migration

  def change do
    create table(:servers) do
      add :name, :string
      add :ip, :string
      add :port, :integer
      add :uptime, :integer
      add :online, :integer
      add :accepted, :integer
      add :blocked, :integer

      timestamps()
    end

  end
end
