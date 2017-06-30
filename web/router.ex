defmodule Bouncy.Router do
  use Bouncy.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Bouncy.Auth, repo: Bouncy.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bouncy do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/users", UserController, only: [:new, :create]
  end

  scope "/", Bouncy do
    pipe_through [:browser, :authenticate_user]

    resources "/users", UserController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bouncy do
  #   pipe_through :api
  # end
end
