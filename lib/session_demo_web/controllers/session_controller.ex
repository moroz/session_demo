defmodule SessionDemoWeb.SessionController do
  use SessionDemoWeb, :controller

  alias SessionDemo.Users

  # GET /sessions/new
  def new(conn, _params) do
    render(conn, "new.html")
  end

  # POST /sessions
  def create(conn, %{"email" => email, "password" => password}) do
    case Users.authenticate_by_email_and_password(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "登入成功。")
        |> put_session(:user_id, user.id)
        |> redirect(to: "/")

      _ ->
        conn
        |> put_flash(:error, "您所輸入的密碼或電子郵件有誤，請重試。")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> clear_session()
    |> put_flash(:info, "已登出，歡迎再次光臨。")
    |> redirect(to: "/sign-in")
  end
end
