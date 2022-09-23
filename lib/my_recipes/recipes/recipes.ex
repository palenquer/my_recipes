defmodule MyRecipes.Recipes do
  alias MyRecipes.Repo
  alias MyRecipes.Recipe

  def show_recipe(id) do
    case Repo.get(Recipe, id) do
      nil ->
        {:error, :not_found}

      recipe ->
        {:ok, recipe}
    end
  end

  def create_recipe(attrs) do
    Recipe.changeset(%Recipe{}, attrs)
    |> Repo.insert()
  end
end
