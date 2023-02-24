defmodule MyRecipesWeb.MyRecipesView do
  use MyRecipesWeb, :view

  def render("index.json", %{recipes: recipes}) do
      %{
        recipes: Enum.map(recipes, fn recipe -> %{
          id: recipe.id,
          title: recipe.title,
          author: recipe.author,
          method: recipe.method,
          ingredients: recipe.ingredients,
          cook_time: recipe.cook_time
        } end)
      }
  end

  def render("show.json", %{recipe: recipe}) do
    %{
      recipe: %{
        id: recipe.id,
        title: recipe.title,
        author: recipe.author,
        method: recipe.method,
        ingredients: recipe.ingredients,
        cook_time: recipe.cook_time
      }
    }
  end

  def render("create.json", %{recipe: recipe}) do
    %{
      recipe: %{
        id: recipe.id,
        title: recipe.title,
        author: recipe.author,
        method: recipe.method,
        ingredients: recipe.ingredients,
        cook_time: recipe.cook_time,
        user_id: recipe.user_id
      }
    }
  end

  def render("delete.json", %{recipe: recipe}) do
    %{
      message: "Recipe with id #{recipe.id} successfully deleted!"
    }
  end
end
