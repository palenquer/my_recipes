defmodule MyRecipesWeb.UserControllerTest do
  use MyRecipesWeb.ConnCase

  alias MyRecipes

  @create_attrs %{
    "username" => "test",
    "password" => "test123"
  }

  def fixture(:user) do
    {:ok, user} = MyRecipes.create_user(@create_attrs)
    user
  end

  describe "create" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), @create_attrs)
      assert %{"id" => id, "password" => password, "recipes" => recipes} = json_response(conn, 201)

      conn = get(conn, Routes.user_path(conn, :show, id))
      assert %{
        "id" => ^id,
        "password" => ^password,
        "username" => "test",
        "recipes" => ^recipes,
      } = json_response(conn, 200)
    end
  end

  describe "update" do
    setup [:create_user]

    test "updates chosen user", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), @create_attrs)
      assert response(conn, 200)
    end
  end

  describe "delete" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 200)

      conn = get(conn, Routes.user_path(conn, :show, user))
      assert %{"message" => "not_found"} = json_response(conn, 404)
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    %{user: user}
  end
end
