defmodule TextThem.Repo do
  use Ecto.Repo,
    otp_app: :text_them,
    adapter: Ecto.Adapters.Postgres
end
