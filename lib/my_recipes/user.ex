defmodule MyRecipes.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyRecipes.Recipe

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "user" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :recipes, Recipe, foreign_key: :id
    timestamps()
  end

  @required_params [:username, :password]

  def changeset(recipe, params) do
    recipe
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
