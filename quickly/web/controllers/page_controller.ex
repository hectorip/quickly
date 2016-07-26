defmodule Quickly.PageController do
  use Quickly.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"

  end

  def about(conn, _params) do
    render conn, "about.html"
  end
  def contact(conn, _params) do
    render conn, "contact.html"
  end
end
