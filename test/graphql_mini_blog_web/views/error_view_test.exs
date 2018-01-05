defmodule GraphqlMiniBlogWeb.ErrorViewTest do
  use GraphqlMiniBlogWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  alias GraphqlMiniBlogWeb.ErrorView

  test "renders 404.json" do
    assert render(ErrorView, "404.json", []) ==
           %{errors: %{detail: "Resource not found"}}
  end

  test "render 500.json" do
    assert render(ErrorView, "500.json", []) ==
           %{errors: %{detail: "Internal server error"}}
  end

  test "render any other" do
    assert render(ErrorView, "505.json", []) ==
           %{errors: %{detail: "Internal server error"}}
  end
end
