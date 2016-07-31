defmodule Quickly.SessionController do
  use Quickly.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

end
