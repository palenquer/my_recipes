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
   |> validate_length(:title, min: 4, max: 30)
   |> validate_length(:ingredients, min: 2, max: 20)
   |> validate_length(:author, min: 2, max: 20)
   |> validate_length(:method, min: 10, max: 300)
   |> validate_inclusion(:cook_time, 1..320)
  end
 end
