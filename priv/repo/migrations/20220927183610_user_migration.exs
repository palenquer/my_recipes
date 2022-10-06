defmodule MyRecipes.Repo.Migrations.UserMigration do
  use Ecto.Migration

  def change do
    create table("user", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :username, :string
      add :password_hash, :string
      add :id_recipe, references(:recipe)
      timestamps()
    end
  end
end
