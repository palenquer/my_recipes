defmodule MyRecipesWeb.MyRecipesController do
  use MyRecipesWeb, :controller
  alias MyRecipes

  action_fallback FallbackController

  def create(conn, params) do
    params
    |> MyRecipes.create()
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> MyRecipes.show()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, %{"id" => id} = params) do
    id
    |> MyRecipes.update(params)
    |> handle_response(conn, "show.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> MyRecipes.delete()
    |> handle_response(conn, "delete.json", :ok)
  end

  defp handle_response({:ok, recipe}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, recipe: recipe)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
