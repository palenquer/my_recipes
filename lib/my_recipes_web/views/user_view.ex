defmodule MyRecipesWeb.UserView do
  use MyRecipesWeb, :view
  alias MyRecipesWeb.MyRecipesView

  def render("show.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      recipes: render_many(user.recipes, MyRecipesView, "show.json", as: :recipe)
    }
  end

  def render("delete.json", %{user: user}) do
    %{
      message: "User with id #{user.id} successfully deleted!"
    }
  end
end
