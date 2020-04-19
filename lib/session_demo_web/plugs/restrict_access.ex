defmodule SessionDemoWeb.Plugs.RestrictAccess do
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]

  alias SessionDemo.Users

  def init(default), do: default

  def call(conn, :browser) do
    case conn.assigns[:current_user] do
      nil ->
        conn
        |> put_flash(:info, "請登入後重新操作。")
        |> redirect(to: "/sign-in")
        |> halt()

      %Users.User{} ->
        conn
    end
  end
end
