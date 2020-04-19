defmodule SessionDemoWeb.Router do
  use SessionDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SessionDemoWeb.Plugs.FetchUser
  end

  pipeline :browser_restricted do
    plug :browser
    plug SessionDemoWeb.Plugs.RestrictAccess, :browser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SessionDemoWeb do
    pipe_through :browser_restricted

    get "/", PageController, :index
    get "/sign-out", SessionController, :delete
  end

  scope "/", SessionDemoWeb do
    pipe_through :browser

    get "/sign-in", SessionController, :new
    post "/sign-in", SessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", SessionDemoWeb do
  #   pipe_through :api
  # end
end
