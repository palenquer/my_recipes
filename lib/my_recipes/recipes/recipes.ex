defmodule MyRecipes.Recipes do
  alias MyRecipes.Repo
  alias MyRecipes.Recipe

  def index_recipe() do
    case Repo.all(Recipe) do
      nil ->
        {:error, :not_found}

      recipes ->
        {:ok, recipes}
    end
  end
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

  def update_recipe(id, attrs) do
    case Repo.get(Recipe, id) do
      nil ->
        {:error, :not_found}

      recipe ->
        Recipe.changeset(recipe, attrs)
        |> Repo.update()
    end
  end

  def delete_recipe(id) do
    case Repo.get(Recipe, id) do
      nil ->
        {:error, :not_found}

      recipe ->
        recipe
        |> Repo.delete()
    end
  end
end
