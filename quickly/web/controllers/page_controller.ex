defmodule Quickly.PageController do
  use Quickly.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
    
  end
end
