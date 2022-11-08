defmodule MyRecipesWeb.MyRecipesController do
  use MyRecipesWeb, :controller
  alias MyRecipes

  action_fallback FallbackController

  def create(conn, params) do
    case MyRecipes.create(params) do
      {:ok, recipe} ->
        conn
        |> put_status(:created)
        |> render("create.json", recipe: recipe)

      {:error, _changeset} = error ->
        error
    end
  end

  def show(conn, %{"id" => id}) do
    case MyRecipes.show(id) do
      {:ok, recipe} ->
        conn
        |> put_status(:ok)
        |> render("show.json", recipe: recipe)

      {:error, _changeset} = error ->
        error
    end
  end

  def update(conn, %{"id" => id} = params) do
    case MyRecipes.update(id, params) do
      {:ok, recipe} ->
        conn
        |> put_status(:ok)
        |> render("show.json", recipe: recipe)

      {:error, _changeset} = error ->
        error
    end
  end

  def delete(conn, %{"id" => id}) do
    case MyRecipes.delete(id) do
      {:ok, recipe} ->
        conn
        |> put_status(:ok)
        |> render("delete.json", recipe: recipe)

      {:error, _changeset} = error ->
        error
    end
  end
end
