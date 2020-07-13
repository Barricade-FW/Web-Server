defmodule WebserverWeb.FilterController do
  use WebserverWeb, :controller

  alias Webserver.Filters
  alias Webserver.Filters.Filter

  def index(conn, _params) do
    filters = Filters.list_filters()

    conn
    |> assign(:page_filters, 1)
    |> render("index.html", filters: filters)
  end

  def new(conn, _params) do
    changeset = Filters.change_filter(%Filter{})

    conn
    |> assign(:page_filters, 1)
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"filter" => filter_params}) do
    case Filters.create_filter(filter_params) do
      {:ok, filter} ->
        conn
        |> put_flash(:info, "Filter created successfully.")
        |> assign(:page_filters, 1)
        |> redirect(to: Routes.filter_path(conn, :show, filter))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:page_filters, 1)
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    filter = Filters.get_filter!(id)

    conn
    |> assign(:page_filters, 1)
    |> render("show.html", filter: filter)
  end

  def edit(conn, %{"id" => id}) do
    filter = Filters.get_filter!(id)
    changeset = Filters.change_filter(filter)

    conn
    |> assign(:page_filters, 1)
    |> render("edit.html", filter: filter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "filter" => filter_params}) do
    filter = Filters.get_filter!(id)

    case Filters.update_filter(filter, filter_params) do
      {:ok, filter} ->
        conn
        |> put_flash(:info, "Filter updated successfully.")
        |> assign(:page_filters, 1)
        |> redirect(to: Routes.filter_path(conn, :show, filter))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:page_filters, 1)
        |> render("edit.html", filter: filter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    filter = Filters.get_filter!(id)
    {:ok, _filter} = Filters.delete_filter(filter)

    conn
    |> put_flash(:info, "Filter deleted successfully.")
    |> assign(:page_filters, 1)
    |> redirect(to: Routes.filter_path(conn, :index))
  end
end
