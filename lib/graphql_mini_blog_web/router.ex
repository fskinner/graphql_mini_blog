defmodule GraphqlMiniBlogWeb.Router do
  use GraphqlMiniBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GraphqlMiniBlogWeb do
    pipe_through :api

    resources "/authors", AuthorController, except: [:new, :edit]
  end
end
