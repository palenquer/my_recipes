defmodule FallbackController do
  use MyRecipesWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{}} = result) do
    conn
    |> put_status(400)
    |> put_view(MyRecipesWeb.ErrorView)
    |> render("400.json", result: result)
  end

  def call(conn, {:error, error}) do
    conn
    |> put_status(error)
    |> put_view(MyRecipesWeb.ErrorView)
    |> render("404.json", message: error)
  end
end
