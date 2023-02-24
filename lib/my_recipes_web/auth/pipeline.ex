defmodule MyRecipesWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :my_recipes

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
