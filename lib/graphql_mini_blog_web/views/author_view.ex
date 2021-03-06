defmodule GraphqlMiniBlogWeb.AuthorView do
  use GraphqlMiniBlogWeb, :view
  alias GraphqlMiniBlogWeb.AuthorView

  def render("index.json", %{authors: authors}) do
    %{data: render_many(authors, AuthorView, "author.json")}
  end

  def render("show.json", %{author: author}) do
    %{data: render_one(author, AuthorView, "author.json")}
  end

  def render("author.json", %{author: author}) do
    %{
      id: author.id,
      email: author.email,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end
end
