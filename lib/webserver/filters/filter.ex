defmodule Webserver.Filters.Filter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "filters" do
    field :action, :integer
    field :blocktime, :integer
    field :bps, :integer
    field :dstip, :string
    field :enabled, :integer
    field :icmpcode, :integer
    field :icmpenabled, :integer
    field :icmptype, :integer
    field :maxlen, :integer
    field :maxttl, :integer
    field :minlen, :integer
    field :minttl, :integer
    field :name, :string
    field :pps, :integer
    field :srcip, :string
    field :tcpack, :integer
    field :tcpdport, :integer
    field :tcpenabled, :integer
    field :tcpfin, :integer
    field :tcppsh, :integer
    field :tcprst, :integer
    field :tcpsport, :integer
    field :tcpsyn, :integer
    field :tcpurg, :integer
    field :tos, :integer
    field :udpdport, :integer
    field :udpenabled, :integer
    field :udpsport, :integer

    timestamps()
  end

  @doc false
  def changeset(filter, attrs) do
    filter
    |> cast(attrs, [:name, :enabled, :action, :srcip, :dstip, :minttl, :maxttl, :minlen, :maxlen, :tos, :pps, :bps, :blocktime, :tcpenabled, :tcpsport, :tcpdport, :tcpurg, :tcpack, :tcprst, :tcppsh, :tcpsyn, :tcpfin, :udpenabled, :udpsport, :udpdport, :icmpenabled, :icmpcode, :icmptype])
    |> validate_required([:name, :enabled, :action, :srcip, :dstip, :minttl, :maxttl, :minlen, :maxlen, :tos, :pps, :bps, :blocktime, :tcpenabled, :tcpsport, :tcpdport, :tcpurg, :tcpack, :tcprst, :tcppsh, :tcpsyn, :tcpfin, :udpenabled, :udpsport, :udpdport, :icmpenabled, :icmpcode, :icmptype])
  end
end
