defmodule MyRecipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipe" do
    field :title, :string
    field :author, :string
    field :method, :string
    field :cook_time, :integer
    field :ingredients, {:array, :string}
    timestamps()
  end

  @required_params [:title, :author, :method, :cook_time, :ingredients]

  def changeset(recipe, params) do
   recipe
   |> cast(params, @required_params)
   |> validate_required(@required_params)
  end
 end
