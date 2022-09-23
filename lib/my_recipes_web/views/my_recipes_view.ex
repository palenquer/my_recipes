defmodule MyRecipesWeb.MyRecipesView do
  use MyRecipesWeb, :view

  def render("create.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      author: recipe.author,
      method: recipe.method,
      ingredients: recipe.ingredients
    }
  end

  def render("show.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      author: recipe.author,
      method: recipe.method,
      ingredients: recipe.ingredients
    }
  end
end
