defmodule GraphqlMiniBlogWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  alias GraphqlMiniBlog.Blog
  alias GraphqlMiniBlogWeb.Resolvers

  object :author do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)

    field :posts, list_of(:post) do
      resolve(fn author, _, _ ->
        Resolvers.Content.list_posts(author.id)
      end)
    end
  end

  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:description, :string)
    field(:about, :string)

    field :author, :author do
      resolve(fn post, _, _ ->
        Resolvers.Content.get_author(%{id: post.author_id})
      end)
    end
  end
end
