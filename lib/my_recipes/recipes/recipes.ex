defmodule MyRecipes.Recipes do
  alias MyRecipes.Repo
  alias MyRecipes.Recipe

  def create_recipe(attrs) do
    Recipe.changeset(%Recipe{}, attrs)
    |> Repo.insert()
  end
end
