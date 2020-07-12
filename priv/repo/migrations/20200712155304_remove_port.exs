defmodule Webserver.Repo.Migrations.RemovePort do
  use Ecto.Migration

  def change do
    alter table(:servers) do
      remove :port
    end
  end
end
