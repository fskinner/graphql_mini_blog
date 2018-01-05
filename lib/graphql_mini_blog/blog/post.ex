defmodule GraphqlMiniBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias GraphqlMiniBlog.Blog.Post


  schema "posts" do
    field :about, :string
    field :description, :string
    field :title, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:description, :title, :about])
    |> validate_required([:description, :title, :about])
    |> validate_length(:title, min: 6)
  end
end
