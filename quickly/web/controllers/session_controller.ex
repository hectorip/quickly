defmodule Quickly.SessionController do
  use Quickly.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params = %{"email" => email, "password" => password}) do
    nil
  end
  def crete(conn, %{"session" => session_params}) do
    case Quickly.Session.login(session_params, Quickly.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Has iniciado sesión")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Email o Password incorrecto")
        |> render("new.html")
    end
  end
end
