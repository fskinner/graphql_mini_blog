defmodule GraphqlMiniBlog.Blog.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias GraphqlMiniBlog.Blog.Author
  alias GraphqlMiniBlog.Blog.Post

  schema "authors" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)

    has_many(:posts, Post)

    timestamps()
  end

  @doc false
  def changeset(%Author{} = author, attrs) do
    author
    |> cast(attrs, [:email, :first_name, :last_name])
    |> validate_required([:email, :first_name, :last_name])
    |> validate_length(:first_name, min: 2)
    |> validate_length(:last_name, min: 2)
    |> validate_length(:email, min: 5, max: 150)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already taken")
  end
end
