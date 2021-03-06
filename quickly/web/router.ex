defmodule Quickly.Router do
  use Quickly.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Quickly do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/contact", PageController, :contact
    resources "/users", UserController, only: [:new, :create]
    resources "/quotes", QuoteController

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete # I don't understand why I'm using delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", Quickly do
  #   pipe_through :api
  # end
end
