defmodule MyRecipesWeb.UserView do
  use MyRecipesWeb, :view
  alias MyRecipesWeb.MyRecipesView

  def render("create.json", %{user: user, token: token}) do
    %{
      message: "User created!",
      user: %{
        id: user.id,
        username: user.username
      },
      token: token
    }
  end

  def render("signin.json", %{token: token}) do
    %{
      token: token
    }
  end

  def render("show.json", %{user: user}) do
    %{
      user: %{
        id: user.id,
        username: user.username,
        recipes: render_many(user.recipes, MyRecipesView, "show.json", as: :recipe)
      }
    }
  end

  def render("delete.json", %{user: user}) do
    %{
      message: "User with id #{user.id} deleted!"
    }
  end
end
