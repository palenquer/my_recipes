defmodule MyRecipesWeb.UserController do
  use MyRecipesWeb, :controller
  alias MyRecipesWeb.Auth.Guardian
  alias MyRecipes.Repo
  alias MyRecipes

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, user} <- MyRecipes.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create.json", %{user: Repo.preload(user, :recipes), token: token})
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("signin.json", token: token)
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
