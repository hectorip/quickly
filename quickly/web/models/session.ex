defmodule Quickly.Session do
  alias Quickly.User

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))

    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  def authenticate(user, password) do
    case user do
      nil -> :error
      _   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Quickly.Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)

end
