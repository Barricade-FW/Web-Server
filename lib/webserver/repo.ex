defmodule Webserver.Repo do
  use Ecto.Repo,
    otp_app: :webserver,
    adapter: Ecto.Adapters.Postgres
end
