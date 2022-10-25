defmodule MyRecipes.Repo.Migrations.Recipe do
  use Ecto.Migration

  def change do
    create table("recipe") do
      add :author, :string
      add :title, :string
      add :method, :string
      add :cook_time, :integer
      add :ingredients, {:array, :string}
      add :user_id, :uuid
      timestamps()
    end
  end
end
