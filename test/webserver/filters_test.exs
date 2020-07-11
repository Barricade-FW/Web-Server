defmodule Webserver.FiltersTest do
  use Webserver.DataCase

  alias Webserver.Filters

  describe "filters" do
    alias Webserver.Filters.Filter

    @valid_attrs %{action: 42, blocktime: 42, bps: 42, dstip: "some dstip", enabled: 42, icmpcode: 42, icmpenabled: 42, icmptype: 42, maxlen: 42, maxttl: 42, minlen: 42, minttl: 42, name: "some name", pps: 42, srcip: "some srcip", tcpack: 42, tcpdport: 42, tcpenabled: 42, tcpfin: 42, tcppsh: 42, tcprst: 42, tcpsport: 42, tcpsyn: 42, tcpurg: 42, tos: 42, udpdport: 42, udpenabled: 42, udpsport: 42}
    @update_attrs %{action: 43, blocktime: 43, bps: 43, dstip: "some updated dstip", enabled: 43, icmpcode: 43, icmpenabled: 43, icmptype: 43, maxlen: 43, maxttl: 43, minlen: 43, minttl: 43, name: "some updated name", pps: 43, srcip: "some updated srcip", tcpack: 43, tcpdport: 43, tcpenabled: 43, tcpfin: 43, tcppsh: 43, tcprst: 43, tcpsport: 43, tcpsyn: 43, tcpurg: 43, tos: 43, udpdport: 43, udpenabled: 43, udpsport: 43}
    @invalid_attrs %{action: nil, blocktime: nil, bps: nil, dstip: nil, enabled: nil, icmpcode: nil, icmpenabled: nil, icmptype: nil, maxlen: nil, maxttl: nil, minlen: nil, minttl: nil, name: nil, pps: nil, srcip: nil, tcpack: nil, tcpdport: nil, tcpenabled: nil, tcpfin: nil, tcppsh: nil, tcprst: nil, tcpsport: nil, tcpsyn: nil, tcpurg: nil, tos: nil, udpdport: nil, udpenabled: nil, udpsport: nil}

    def filter_fixture(attrs \\ %{}) do
      {:ok, filter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Filters.create_filter()

      filter
    end

    test "list_filters/0 returns all filters" do
      filter = filter_fixture()
      assert Filters.list_filters() == [filter]
    end

    test "get_filter!/1 returns the filter with given id" do
      filter = filter_fixture()
      assert Filters.get_filter!(filter.id) == filter
    end

    test "create_filter/1 with valid data creates a filter" do
      assert {:ok, %Filter{} = filter} = Filters.create_filter(@valid_attrs)
      assert filter.action == 42
      assert filter.blocktime == 42
      assert filter.bps == 42
      assert filter.dstip == "some dstip"
      assert filter.enabled == 42
      assert filter.icmpcode == 42
      assert filter.icmpenabled == 42
      assert filter.icmptype == 42
      assert filter.maxlen == 42
      assert filter.maxttl == 42
      assert filter.minlen == 42
      assert filter.minttl == 42
      assert filter.name == "some name"
      assert filter.pps == 42
      assert filter.srcip == "some srcip"
      assert filter.tcpack == 42
      assert filter.tcpdport == 42
      assert filter.tcpenabled == 42
      assert filter.tcpfin == 42
      assert filter.tcppsh == 42
      assert filter.tcprst == 42
      assert filter.tcpsport == 42
      assert filter.tcpsyn == 42
      assert filter.tcpurg == 42
      assert filter.tos == 42
      assert filter.udpdport == 42
      assert filter.udpenabled == 42
      assert filter.udpsport == 42
    end

    test "create_filter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Filters.create_filter(@invalid_attrs)
    end

    test "update_filter/2 with valid data updates the filter" do
      filter = filter_fixture()
      assert {:ok, %Filter{} = filter} = Filters.update_filter(filter, @update_attrs)
      assert filter.action == 43
      assert filter.blocktime == 43
      assert filter.bps == 43
      assert filter.dstip == "some updated dstip"
      assert filter.enabled == 43
      assert filter.icmpcode == 43
      assert filter.icmpenabled == 43
      assert filter.icmptype == 43
      assert filter.maxlen == 43
      assert filter.maxttl == 43
      assert filter.minlen == 43
      assert filter.minttl == 43
      assert filter.name == "some updated name"
      assert filter.pps == 43
      assert filter.srcip == "some updated srcip"
      assert filter.tcpack == 43
      assert filter.tcpdport == 43
      assert filter.tcpenabled == 43
      assert filter.tcpfin == 43
      assert filter.tcppsh == 43
      assert filter.tcprst == 43
      assert filter.tcpsport == 43
      assert filter.tcpsyn == 43
      assert filter.tcpurg == 43
      assert filter.tos == 43
      assert filter.udpdport == 43
      assert filter.udpenabled == 43
      assert filter.udpsport == 43
    end

    test "update_filter/2 with invalid data returns error changeset" do
      filter = filter_fixture()
      assert {:error, %Ecto.Changeset{}} = Filters.update_filter(filter, @invalid_attrs)
      assert filter == Filters.get_filter!(filter.id)
    end

    test "delete_filter/1 deletes the filter" do
      filter = filter_fixture()
      assert {:ok, %Filter{}} = Filters.delete_filter(filter)
      assert_raise Ecto.NoResultsError, fn -> Filters.get_filter!(filter.id) end
    end

    test "change_filter/1 returns a filter changeset" do
      filter = filter_fixture()
      assert %Ecto.Changeset{} = Filters.change_filter(filter)
    end
  end
end
