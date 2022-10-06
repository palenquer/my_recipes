defmodule MyRecipes do
  @moduledoc """
  MyRecipes keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias MyRecipes.Recipes
  alias MyRecipes.Users

  defdelegate create(params), to: Recipes, as: :create_recipe
  defdelegate show(id), to: Recipes, as: :show_recipe
  defdelegate update(id, params), to: Recipes, as: :update_recipe
  defdelegate delete(id), to: Recipes, as: :delete_recipe

  defdelegate create_user(params), to: Users, as: :create_user
  defdelegate show_user(id), to: Users, as: :show_user
  defdelegate update_user(id, params), to: Users, as: :update_user
  defdelegate delete_user(id), to: Users, as: :delete_user
end
