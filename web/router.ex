defmodule MyTurn.Router do
  use MyTurn.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MyTurn.Auth, repo: MyTurn.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyTurn do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/meetings", MeetingController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyTurn do
  #   pipe_through :api
  # end
end
