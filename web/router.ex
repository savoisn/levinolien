defmodule Appli.Router do
  use Appli.Web, :router

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

  scope "/", Appli do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/papers", PapersController, :index
    resources "/signatures", SignatureController
    # resources "/signatures_admin", SignatureAdminController
    resources "/.well-known/acme-challenge", WellknowController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Appli do
  #   pipe_through :api
  # end
end
