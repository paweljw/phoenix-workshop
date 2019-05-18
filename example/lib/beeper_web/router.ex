defmodule BeeperWeb.Router do
  use BeeperWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # Add this block
  pipeline :protected do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Coherence.Authentication.Session, protected: true)
  end

  # Add this block
  scope "/" do
    pipe_through(:browser)
    coherence_routes()
  end

  # Add this block
  scope "/" do
    pipe_through(:protected)
    coherence_routes(:protected)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BeeperWeb do
    pipe_through [:browser, :protected]

    get "/", PostController, :index
    resources "/posts", PostController, only: [:new, :create]
  end
end
