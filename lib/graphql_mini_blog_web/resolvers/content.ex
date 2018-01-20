defmodule GraphqlMiniBlogWeb.Resolvers.Content do
  alias GraphqlMiniBlog.Blog

  def list_posts(_parent, _args, _resolution) do
    {:ok, Blog.list_posts()}
  end

  def list_posts(author_id) do
    {:ok, Blog.list_posts(author_id)}
  end

  def list_authors(_parent, _args, _resolution) do
    {:ok, Blog.list_authors()}
  end

  def get_post(%{id: id}, _info) do
    {:ok, Blog.get_post(id)}
  end

  def get_author(%{id: id}) do
    {:ok, Blog.get_author(id)}
  end
end
