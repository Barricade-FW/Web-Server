defmodule WebserverWeb.PageController do
  use WebserverWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:page_dashboard, 1)
    |> render("index.html")
  end
end
