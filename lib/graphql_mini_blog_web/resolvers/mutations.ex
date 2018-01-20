defmodule GraphqlMiniBlogWeb.Resolvers.Mutations do
  import Ecto.Query, warn: false
  alias GraphqlMiniBlog.Repo

  alias GraphqlMiniBlog.Blog.Author

  alias GraphqlMiniBlog.Blog

  def create_author(_root, args, _info) do
    case Blog.create_author(args) do
      {:ok, author} ->
        {:ok, author}

      {:error, _changeset} ->
        {:error, "could not create author"}
    end
  end

  def update_author(%{id: id, author: author_params}, _info) do
    Repo.get!(Author, id)
    |> Author.changeset(author_params)
    |> Repo.update()
  end

  def delete_author(%{id: id}, _info) do
    Repo.get!(Author, id)
    |> Repo.delete()
  end
end
