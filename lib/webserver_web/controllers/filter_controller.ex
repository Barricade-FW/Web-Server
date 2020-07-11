defmodule WebserverWeb.FilterController do
  use WebserverWeb, :controller

  alias Webserver.Filters
  alias Webserver.Filters.Filter

  def index(conn, _params) do
    filters = Filters.list_filters()
    render(conn, "index.html", filters: filters)
  end

  def new(conn, _params) do
    changeset = Filters.change_filter(%Filter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"filter" => filter_params}) do
    case Filters.create_filter(filter_params) do
      {:ok, filter} ->
        conn
        |> put_flash(:info, "Filter created successfully.")
        |> redirect(to: Routes.filter_path(conn, :show, filter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    filter = Filters.get_filter!(id)
    render(conn, "show.html", filter: filter)
  end

  def edit(conn, %{"id" => id}) do
    filter = Filters.get_filter!(id)
    changeset = Filters.change_filter(filter)
    render(conn, "edit.html", filter: filter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "filter" => filter_params}) do
    filter = Filters.get_filter!(id)

    case Filters.update_filter(filter, filter_params) do
      {:ok, filter} ->
        conn
        |> put_flash(:info, "Filter updated successfully.")
        |> redirect(to: Routes.filter_path(conn, :show, filter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", filter: filter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    filter = Filters.get_filter!(id)
    {:ok, _filter} = Filters.delete_filter(filter)

    conn
    |> put_flash(:info, "Filter deleted successfully.")
    |> redirect(to: Routes.filter_path(conn, :index))
  end
end
