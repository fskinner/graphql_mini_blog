defmodule GraphqlMiniBlogWeb.AuthorControllerTest do
  use GraphqlMiniBlogWeb.ConnCase

  alias GraphqlMiniBlog.Blog
  alias GraphqlMiniBlog.Blog.Author

  @create_attrs %{email: "a@a.c", first_name: "some first_name", last_name: "some last_name"}
  @update_attrs %{
    email: "b@b.c",
    first_name: "some updated first_name",
    last_name: "some updated last_name"
  }
  @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

  def fixture(:author) do
    {:ok, author} = Blog.create_author(@create_attrs)
    author
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all authors", %{conn: conn} do
      conn = get(conn, author_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create author" do
    test "renders author when data is valid", %{conn: conn} do
      conn = post(conn, author_path(conn, :create), author: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, author_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "email" => "a@a.c",
               "first_name" => "some first_name",
               "last_name" => "some last_name"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, author_path(conn, :create), author: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update author" do
    setup [:create_author]

    test "renders author when data is valid", %{conn: conn, author: %Author{id: id} = author} do
      conn = put(conn, author_path(conn, :update, author), author: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, author_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "email" => "b@b.c",
               "first_name" => "some updated first_name",
               "last_name" => "some updated last_name"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, author: author} do
      conn = put(conn, author_path(conn, :update, author), author: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete author" do
    setup [:create_author]

    test "deletes chosen author", %{conn: conn, author: author} do
      conn = delete(conn, author_path(conn, :delete, author))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, author_path(conn, :show, author))
      end)
    end
  end

  defp create_author(_) do
    author = fixture(:author)
    {:ok, author: author}
  end
end
