defmodule MyRecipesWeb.UserController do
  use MyRecipesWeb, :controller
  alias MyRecipes.Repo
  alias MyRecipes

  action_fallback FallbackController

  def create(conn, params) do
    case MyRecipes.create_user(params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: Repo.preload(user, :recipes))

      {:error, _changeset} = error ->
        error
    end
  end

  def show(conn, %{"id" => id}) do
    case MyRecipes.show_user(id) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: Repo.preload(user, :recipes))

      {:error, _changeset} = error ->
        error
    end
  end

  def update(conn, %{"id" => id} = params) do
    case MyRecipes.update_user(id, params) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: Repo.preload(user, :recipes))

      {:error, _changeset} = error ->
        error
    end
  end

  def delete(conn, %{"id" => id}) do
    case MyRecipes.delete_user(id) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("delete.json", user: Repo.preload(user, :recipes))

      {:error, _changeset} = error ->
        error
    end
  end
end
