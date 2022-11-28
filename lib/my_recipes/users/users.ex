defmodule MyRecipes.Users do
  alias MyRecipes.Repo
  alias MyRecipes.User

  def show_user(id) do
    with {:ok, user_id} <- Ecto.UUID.cast(id),
         user <- Repo.get(User, user_id) do
      {:ok, user}
    else
      :error -> {:error, :not_found}
    end
  end

  def create_user(attrs) do
    User.changeset(%User{}, attrs)
    |> Repo.insert()
  end

  def update_user(id, attrs) do
    case Repo.get(User, id) do
      nil ->
        {:error, :not_found}

      user ->
        User.changeset(user, attrs)
        |> Repo.update()
    end
  end

  def delete_user(id) do
    case Repo.get(User, id) do
      nil ->
        {:error, :not_found}

      user ->
        user
        |> Repo.delete()
    end
  end
end
