defmodule MyRecipesWeb.MyRecipesView do
  use MyRecipesWeb, :view

  def render("show.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      author: recipe.author,
      method: recipe.method,
      ingredients: recipe.ingredients
    }
  end

  def render("delete.json", %{recipe: recipe}) do
    %{
      message: "Recipe with id #{recipe.id} successfully deleted!"
    }
  end
end
