defmodule Quickly.UserController do
  use Quickly.Web, :controller
  alias Quickly.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Quickly.Registration.create(changeset, Quickly.Repo) do
      {:ok, changeset} ->
        conn
        |> put_session(:current_user, changeset.id)
        |> put_flash(:info, "Tu cuenta ha sido creada")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Ocurrió un error al crear tu cuenta")
        |> render("new.html", changeset: changeset)
    end
  end
end
