defmodule MyRecipes.Repo do
  use Ecto.Repo,
    otp_app: :my_recipes,
    adapter: Ecto.Adapters.Postgres
end
