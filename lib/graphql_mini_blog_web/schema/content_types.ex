defmodule GraphqlMiniBlogWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  alias GraphqlMiniBlog.Blog

  object :author do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :posts, list_of(:post) do
      resolve fn author, _, _ ->
        {:ok, Blog.list_posts(author.id)}
        # {:ok, Resolvers.Content.find_posts(author.id)}
      end
    end
  end
  
  object :post do
    field :id, :id
    field :title, :string
    field :description, :string
    field :about, :string
    field :author, :author do
      resolve fn post, _, _ ->
        {:ok, Blog.get_author(post.author_id)}
        # {:ok, Resolvers.Content.get_author(post.author.id)}
      end
    end
    field :votes, :integer
  end
end