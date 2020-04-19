defmodule SessionDemoWeb.Plugs.FetchUser do
  import Plug.Conn

  alias SessionDemo.Users

  def init(default), do: default

  def call(conn, _opts) do
    user =
      case get_session(conn, :user_id) do
        nil ->
          nil

        user_id ->
          Users.get_user!(user_id)
      end

    assign(conn, :current_user, user)
  end
end
