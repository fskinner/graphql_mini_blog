defmodule GraphqlMiniBlogWeb.Schema do
  use Absinthe.Schema
  import_types GraphqlMiniBlogWeb.Schema.ContentTypes

  alias GraphqlMiniBlogWeb.Resolvers

  query do

    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve &Resolvers.Content.list_posts/3
    end

    @desc "Get all authors"
    field :authors, list_of(:author) do
      resolve &Resolvers.Content.list_authors/3
    end

    @desc "Get post by id"
    field :post, type: :post do
      arg :id, non_null(:id)
      resolve &Resolvers.Content.get_post/2
    end

    @desc "Get author by id"
    field :author, type: :author do
      arg :id, non_null(:id)
      resolve &Resolvers.Content.get_author/2
    end
  end
end