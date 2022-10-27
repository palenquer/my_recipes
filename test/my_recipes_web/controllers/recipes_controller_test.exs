defmodule MyRecipesWeb.RecipesControllerTest do
  use MyRecipesWeb.ConnCase

  alias MyRecipes

  @create_attrs %{
      author: "test",
      title: "test",
      ingredients: ["test", "test"],
      method: "testing method",
      cook_time: 60,
      user_id: "c2ff7a8e-c662-4b09-b0f6-4e2d1ca48941"
  }

  def fixture(:recipe) do
    {:ok, recipe} = MyRecipes.create(@create_attrs)
    recipe
  end

  describe "create" do
    test "renders recipe when data is valid", %{conn: conn} do
      conn = post(conn, Routes.my_recipes_path(conn, :create), @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, Routes.my_recipes_path(conn, :show, id))

      assert %{
        "id" => ^id,
        "author" => "test",
        "title" => "test",
        "ingredients" => ["test", "test"],
        "method" => "testing method",
        "cook_time" => 60
      } = json_response(conn, 200)
    end
  end

  describe "update" do
    setup [:create_recipe]

    test "updates chosen recipe", %{conn: conn, recipe: recipe} do
      conn = put(conn, Routes.my_recipes_path(conn, :update, recipe))
      assert response(conn, 200)
    end
  end

  describe "delete" do
    setup [:create_recipe]

    test "deletes chosen recipe", %{conn: conn, recipe: recipe} do
      conn = delete(conn, Routes.my_recipes_path(conn, :delete, recipe))
      assert response(conn, 200)

      conn = get(conn, Routes.my_recipes_path(conn, :show, recipe))
      assert %{"message" => "not_found"} = json_response(conn, 404)
    end
  end

  defp create_recipe(_) do
    recipe = fixture(:recipe)
    %{recipe: recipe}
  end
end
