defmodule Quickly.UserController do
  use Quickly.Web, :controller
  alias Quickly.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
end
