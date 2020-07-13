defmodule WebserverWeb.UserController do
  use WebserverWeb, :controller

  alias Webserver.Accounts
  alias Webserver.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()

    conn
    |> assign(:page_users, 1)
    |> render("index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})

    conn
    |> assign(:page_users, 1)
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> assign(:page_users, 1)
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:page_users, 1)
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    conn
    |> assign(:page_users, 1)
    |> render("show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)

    conn
    |> assign(:page_users, 1)
    |> render("edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> assign(:page_users, 1)
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:page_users, 1)
        |> render("edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> assign(:page_users, 1)
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
