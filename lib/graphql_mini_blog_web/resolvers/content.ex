defmodule GraphqlMiniBlogWeb.Resolvers.Content do
  alias GraphqlMiniBlog.Blog

  def list_posts(_parent, _args, _resolution) do
    {:ok, Blog.list_posts()}
  end

  def list_authors(_parent, _args, _resolution) do
    {:ok, Blog.list_authors()}
  end

end