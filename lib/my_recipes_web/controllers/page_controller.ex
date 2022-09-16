defmodule MyRecipesWeb.PageController do
  use MyRecipesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
