defmodule MyRecipes do
  @moduledoc """
  MyRecipes keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias MyRecipes.Recipes

  defdelegate create(params), to: Recipes, as: :create_recipe
  defdelegate show(id), to: Recipes, as: :show_recipe
end
