defmodule MyRecipesWeb.UserController do
  use MyRecipesWeb, :controller
  alias MyRecipes.Repo
  alias MyRecipes

  action_fallback FallbackController
  def create(conn, params) do
    params
    |> MyRecipes.create_user()
    |> handle_response(conn, "show.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> MyRecipes.show_user()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, %{"id" => id} = params) do
    id
    |> MyRecipes.update_user(params)
    |> handle_response(conn, "show.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> MyRecipes.delete_user()
    |> handle_response(conn, "delete.json", :ok)
  end

  defp handle_response({:ok, user}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, user: Repo.preload(user, :recipes))
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
