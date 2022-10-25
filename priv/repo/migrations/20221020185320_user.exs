defmodule MyRecipes.Repo.Migrations.User do
  use Ecto.Migration

  def change do
    create table("user", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :username, :string
      add :password_hash, :string
      add :recipes, references(:recipe)
      timestamps()
    end
  end
end
