defmodule Webserver.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :hpassword, :string

      timestamps()
    end

  end
end
