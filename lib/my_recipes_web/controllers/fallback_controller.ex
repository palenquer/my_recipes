defmodule FallbackController do
  use MyRecipesWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{}} = result) do
    conn
    |> put_status(400)
    |> put_view(MyRecipesWeb.ErrorView)
    |> render("400.json", result: result)
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(MyRecipesWeb.ErrorView)
    |> render("401.json", message: "User unauthorized")
  end

  def call(conn, {:error, error}) do
    conn
    |> put_status(404)
    |> put_view(MyRecipesWeb.ErrorView)
    |> render("404.json", message: error)
  end
end
