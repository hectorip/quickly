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
        # signin
      {:error, changeset} ->
        #show error message
    end
  end
end
