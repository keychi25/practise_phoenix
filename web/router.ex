defmodule PractisePhoenix.Router do
  use PractisePhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PractisePhoenix.Auth, repo: PractisePhoenix.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PractisePhoenix do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index

    resources "/users", UserController do
      pipe_through [:authenticate_user]
    end

    resources "/lessons", LessonController do
      pipe_through [:authenticate_user]
    end

    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
end
