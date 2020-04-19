defmodule SessionDemo.Repo do
  use Ecto.Repo,
    otp_app: :session_demo,
    adapter: Ecto.Adapters.Postgres
end
