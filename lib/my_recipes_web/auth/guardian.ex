defmodule MyRecipesWeb.Auth.Guardian do
  alias MyRecipes.{Repo, User}
  use Guardian, otp_app: :my_recipes

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def resource_from_claims(%{"sub" => id}) do
    resource = MyRecipes.show_user(id)
    {:ok, resource}
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, id} <- Ecto.UUID.cast(user_id),
         user <- Repo.get(User, id) do
      validate_password(user, password)
    else
      :error -> {:error, "User not found!"}
    end
  end

  def validate_password(%User{password_hash: hash} = user, password) do
    case Argon2.verify_pass(password, hash) do
      true -> create_token(user)
      false -> {:error, :unauthorized}
    end
  end

  def create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, token}
  end
end
