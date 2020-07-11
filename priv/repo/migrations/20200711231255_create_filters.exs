defmodule Webserver.Repo.Migrations.CreateFilters do
  use Ecto.Migration

  def change do
    create table(:filters) do
      add :name, :string
      add :enabled, :integer
      add :action, :integer
      add :srcip, :string
      add :dstip, :string
      add :minttl, :integer
      add :maxttl, :integer
      add :minlen, :integer
      add :maxlen, :integer
      add :tos, :integer
      add :pps, :integer
      add :bps, :integer
      add :blocktime, :integer
      add :tcpenabled, :integer
      add :tcpsport, :integer
      add :tcpdport, :integer
      add :tcpurg, :integer
      add :tcpack, :integer
      add :tcprst, :integer
      add :tcppsh, :integer
      add :tcpsyn, :integer
      add :tcpfin, :integer
      add :udpenabled, :integer
      add :udpsport, :integer
      add :udpdport, :integer
      add :icmpenabled, :integer
      add :icmpcode, :integer
      add :icmptype, :integer

      timestamps()
    end

  end
end
