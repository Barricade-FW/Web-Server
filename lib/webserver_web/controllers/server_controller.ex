defmodule WebserverWeb.ServerController do
  use WebserverWeb, :controller

  alias Webserver.Servers
  alias Webserver.Servers.Server

  def index(conn, _params) do
    servers = Servers.list_servers()

    conn
    |> assign(:page_servers, 1)
    |> render("index.html", servers: servers)
  end

  def new(conn, _params) do
    changeset = Servers.change_server(%Server{})

    conn
    |> assign(:page_servers, 1)
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"server" => server_params}) do
    case Servers.create_server(server_params) do
      {:ok, server} ->
        conn
        |> put_flash(:info, "Server created successfully.")
        |> assign(:page_servers, 1)
        |> redirect(to: Routes.server_path(conn, :show, server))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:page_servers, 1)
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    server = Servers.get_server!(id)

    conn
    |> assign(:page_servers, 1)
    |> render("show.html", server: server)
  end

  def edit(conn, %{"id" => id}) do
    server = Servers.get_server!(id)
    changeset = Servers.change_server(server)

    conn
    |> assign(:page_servers, 1)
    |> render("edit.html", server: server, changeset: changeset)
  end

  def update(conn, %{"id" => id, "server" => server_params}) do
    server = Servers.get_server!(id)

    case Servers.update_server(server, server_params) do
      {:ok, server} ->
        conn
        |> put_flash(:info, "Server updated successfully.")
        |> assign(:page_servers, 1)
        |> redirect(to: Routes.server_path(conn, :show, server))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:page_servers, 1)
        |> render("edit.html", server: server, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    server = Servers.get_server!(id)
    {:ok, _server} = Servers.delete_server(server)

    conn
    |> put_flash(:info, "Server deleted successfully.")
    |> assign(:page_servers, 1)
    |> redirect(to: Routes.server_path(conn, :index))
  end
end
