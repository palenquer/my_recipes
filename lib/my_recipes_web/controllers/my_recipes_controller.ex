defmodule MyRecipesWeb.MyRecipesController do
  use MyRecipesWeb, :controller
  alias MyRecipes

  def create(conn, params) do
    params
    |> MyRecipes.create()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, recipe}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, recipe: recipe)
  end
end
