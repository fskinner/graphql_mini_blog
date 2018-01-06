defmodule GraphqlMiniBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  
  alias GraphqlMiniBlog.Blog.Post
  alias GraphqlMiniBlog.Blog.Author


  schema "posts" do
    field :about, :string
    field :description, :string
    field :title, :string

    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:description, :title, :about, :author_id])
    |> validate_required([:description, :title, :about])
    |> validate_length(:title, min: 6)
    # |> assoc_constraint(:author)
  end
end
