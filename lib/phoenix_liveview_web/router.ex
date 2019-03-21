defmodule PhoenixLiveviewWeb.Router do
  use PhoenixLiveviewWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {PhoenixLiveviewWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixLiveviewWeb do
    pipe_through :browser

    live("/", PageLive)
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixLiveviewWeb do
  #   pipe_through :api
  # end
end
