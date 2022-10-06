defmodule MyRecipesWeb.UserView do
  use MyRecipesWeb, :view

  def render("show.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      password: user.password_hash
    }
  end

  def render("delete.json", %{user: user}) do
    %{
      message: "User with id #{user.id} successfully deleted!"
    }
  end
end
