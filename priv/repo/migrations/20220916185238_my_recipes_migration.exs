defmodule MyRecipes.Repo.Migrations.MyRecipesMigration do
  use Ecto.Migration

  def change do
    create table("recipe") do
      add :author, :string
      add :title, :string
      add :method, :string
      add :cook_time, :integer
      add :ingredients, {:array, :string}

      timestamps()
    end
  end
end
