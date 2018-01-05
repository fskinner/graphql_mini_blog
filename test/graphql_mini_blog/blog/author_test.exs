defmodule GraphqlMiniBlog.AuthorTest do
  use GraphqlMiniBlog.DataCase

  alias GraphqlMiniBlog.Blog.Author

  @valid_attrs %{email: "bar@baz.com", first_name: "foo", last_name: "baz"}

  test "changeset with valid attributes" do
    changeset = Author.changeset(%Author{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset, email too short " do
    changeset = Author.changeset(
      %Author{}, Map.put(@valid_attrs, :email, "")
    )
    refute changeset.valid?
  end

  test "changeset, email invalid format" do
    changeset = Author.changeset(
      %Author{}, Map.put(@valid_attrs, :email, "foo.com")
    )
    refute changeset.valid?
  end

  test "changeset, first_name too short" do
    changeset = Author.changeset(
      %Author{}, Map.put(@valid_attrs, :first_name, "a")
    )
    refute changeset.valid?
  end

  test "changeset, last_name too short" do
    changeset = Author.changeset(
      %Author{}, Map.put(@valid_attrs, :last_name, "a")
    )
    refute changeset.valid?
  end
end