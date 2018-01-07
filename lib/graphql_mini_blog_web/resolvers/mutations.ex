defmodule GraphqlMiniBlogWeb.Resolvers.Mutations do
  alias GraphqlMiniBlog.Blog

  def create_author(_root, args, _info) do
    case Blog.create_author(args) do
      {:ok, author} ->
        {:ok, author}
      {:error, _changeset} ->
        {:error, "could not create author"}
    end
  end
end