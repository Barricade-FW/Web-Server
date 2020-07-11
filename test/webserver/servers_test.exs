defmodule Webserver.ServersTest do
  use Webserver.DataCase

  alias Webserver.Servers

  describe "servers" do
    alias Webserver.Servers.Server

    @valid_attrs %{accepted: 42, blocked: 42, ip: "some ip", name: "some name", online: 42, port: 42, uptime: 42}
    @update_attrs %{accepted: 43, blocked: 43, ip: "some updated ip", name: "some updated name", online: 43, port: 43, uptime: 43}
    @invalid_attrs %{accepted: nil, blocked: nil, ip: nil, name: nil, online: nil, port: nil, uptime: nil}

    def server_fixture(attrs \\ %{}) do
      {:ok, server} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Servers.create_server()

      server
    end

    test "list_servers/0 returns all servers" do
      server = server_fixture()
      assert Servers.list_servers() == [server]
    end

    test "get_server!/1 returns the server with given id" do
      server = server_fixture()
      assert Servers.get_server!(server.id) == server
    end

    test "create_server/1 with valid data creates a server" do
      assert {:ok, %Server{} = server} = Servers.create_server(@valid_attrs)
      assert server.accepted == 42
      assert server.blocked == 42
      assert server.ip == "some ip"
      assert server.name == "some name"
      assert server.online == 42
      assert server.port == 42
      assert server.uptime == 42
    end

    test "create_server/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Servers.create_server(@invalid_attrs)
    end

    test "update_server/2 with valid data updates the server" do
      server = server_fixture()
      assert {:ok, %Server{} = server} = Servers.update_server(server, @update_attrs)
      assert server.accepted == 43
      assert server.blocked == 43
      assert server.ip == "some updated ip"
      assert server.name == "some updated name"
      assert server.online == 43
      assert server.port == 43
      assert server.uptime == 43
    end

    test "update_server/2 with invalid data returns error changeset" do
      server = server_fixture()
      assert {:error, %Ecto.Changeset{}} = Servers.update_server(server, @invalid_attrs)
      assert server == Servers.get_server!(server.id)
    end

    test "delete_server/1 deletes the server" do
      server = server_fixture()
      assert {:ok, %Server{}} = Servers.delete_server(server)
      assert_raise Ecto.NoResultsError, fn -> Servers.get_server!(server.id) end
    end

    test "change_server/1 returns a server changeset" do
      server = server_fixture()
      assert %Ecto.Changeset{} = Servers.change_server(server)
    end
  end
end
