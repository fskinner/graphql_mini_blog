defmodule GraphqlMiniBlogWeb.Router do
  use GraphqlMiniBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GraphqlMiniBlogWeb do
    pipe_through :api

    resources "/authors", AuthorController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: GraphqlMiniBlogWeb.Schema

    forward "/", Absinthe.Plug,
      schema: GraphqlMiniBlogWeb.Schema
  end
end
