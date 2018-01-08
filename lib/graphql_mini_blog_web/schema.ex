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
      resolve &Resolvers.Content.get_author/1
    end
  end

  input_object :update_author_params do
    field :email, non_null(:string)
    field :first_name, non_null(:string)
    field :last_name, non_null(:string)
  end

  mutation do
    @desc "Create author with email, fist name and last name"
    field :create_author, :author do
      arg :email, non_null(:string)
      arg :first_name, non_null(:string)
      arg :last_name, non_null(:string)
  
      resolve &Resolvers.Mutations.create_author/3
    end

    @desc "Update author with id, email, fist name and last name"
    field :update_author, :author do
      arg :id, non_null(:integer)
      arg :author, :update_author_params
   
      resolve &Resolvers.Mutations.update_author/2
    end

    @desc "Delete author with id"
    field :delete_author, :author do
      arg :id, non_null(:integer)
   
      resolve &Resolvers.Mutations.delete_author/2
    end
  end
end