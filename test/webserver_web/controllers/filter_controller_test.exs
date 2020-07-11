defmodule WebserverWeb.FilterControllerTest do
  use WebserverWeb.ConnCase

  alias Webserver.Filters

  @create_attrs %{action: 42, blocktime: 42, bps: 42, dstip: "some dstip", enabled: 42, icmpcode: 42, icmpenabled: 42, icmptype: 42, maxlen: 42, maxttl: 42, minlen: 42, minttl: 42, name: "some name", pps: 42, srcip: "some srcip", tcpack: 42, tcpdport: 42, tcpenabled: 42, tcpfin: 42, tcppsh: 42, tcprst: 42, tcpsport: 42, tcpsyn: 42, tcpurg: 42, tos: 42, udpdport: 42, udpenabled: 42, udpsport: 42}
  @update_attrs %{action: 43, blocktime: 43, bps: 43, dstip: "some updated dstip", enabled: 43, icmpcode: 43, icmpenabled: 43, icmptype: 43, maxlen: 43, maxttl: 43, minlen: 43, minttl: 43, name: "some updated name", pps: 43, srcip: "some updated srcip", tcpack: 43, tcpdport: 43, tcpenabled: 43, tcpfin: 43, tcppsh: 43, tcprst: 43, tcpsport: 43, tcpsyn: 43, tcpurg: 43, tos: 43, udpdport: 43, udpenabled: 43, udpsport: 43}
  @invalid_attrs %{action: nil, blocktime: nil, bps: nil, dstip: nil, enabled: nil, icmpcode: nil, icmpenabled: nil, icmptype: nil, maxlen: nil, maxttl: nil, minlen: nil, minttl: nil, name: nil, pps: nil, srcip: nil, tcpack: nil, tcpdport: nil, tcpenabled: nil, tcpfin: nil, tcppsh: nil, tcprst: nil, tcpsport: nil, tcpsyn: nil, tcpurg: nil, tos: nil, udpdport: nil, udpenabled: nil, udpsport: nil}

  def fixture(:filter) do
    {:ok, filter} = Filters.create_filter(@create_attrs)
    filter
  end

  describe "index" do
    test "lists all filters", %{conn: conn} do
      conn = get(conn, Routes.filter_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Filters"
    end
  end

  describe "new filter" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.filter_path(conn, :new))
      assert html_response(conn, 200) =~ "New Filter"
    end
  end

  describe "create filter" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.filter_path(conn, :create), filter: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.filter_path(conn, :show, id)

      conn = get(conn, Routes.filter_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Filter"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.filter_path(conn, :create), filter: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Filter"
    end
  end

  describe "edit filter" do
    setup [:create_filter]

    test "renders form for editing chosen filter", %{conn: conn, filter: filter} do
      conn = get(conn, Routes.filter_path(conn, :edit, filter))
      assert html_response(conn, 200) =~ "Edit Filter"
    end
  end

  describe "update filter" do
    setup [:create_filter]

    test "redirects when data is valid", %{conn: conn, filter: filter} do
      conn = put(conn, Routes.filter_path(conn, :update, filter), filter: @update_attrs)
      assert redirected_to(conn) == Routes.filter_path(conn, :show, filter)

      conn = get(conn, Routes.filter_path(conn, :show, filter))
      assert html_response(conn, 200) =~ "some updated dstip"
    end

    test "renders errors when data is invalid", %{conn: conn, filter: filter} do
      conn = put(conn, Routes.filter_path(conn, :update, filter), filter: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Filter"
    end
  end

  describe "delete filter" do
    setup [:create_filter]

    test "deletes chosen filter", %{conn: conn, filter: filter} do
      conn = delete(conn, Routes.filter_path(conn, :delete, filter))
      assert redirected_to(conn) == Routes.filter_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.filter_path(conn, :show, filter))
      end
    end
  end

  defp create_filter(_) do
    filter = fixture(:filter)
    %{filter: filter}
  end
end
