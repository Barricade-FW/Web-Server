defmodule Webserver.Repo.Migrations.CreateServerfilters do
  use Ecto.Migration

  def change do
    create table(:serverfilters) do
      add :filterid, :integer
      add :serverid, :integer

      timestamps()
    end

  end
end
