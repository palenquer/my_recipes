defmodule MyRecipesWeb.UserControllerTest do
  use MyRecipesWeb.ConnCase
  import MyRecipesWeb.Auth.Guardian
  alias MyRecipes.User

  @create_attrs %{
    "username" => "test",
    "password" => "test123"
  }

  describe "show/2" do
    setup %{conn: conn} do
      params = @create_attrs
      {:ok, user} = MyRecipes.create_user(params)
      {:ok, token, _claims} = encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "when there is a user with the given id, returns the user", %{conn: conn} do
      {:ok, %User{id: id}} = MyRecipes.create_user(@create_attrs)

      response =
        conn
        |> get(Routes.user_path(conn, :show, id))
        |> json_response(:ok)

      %{"user" => user} = response

      assert %{"id" => _id, "recipes" => _recipes, "username" => "test"} = user
    end
  end

  describe "create" do
    test "renders user when data is valid", %{conn: conn} do
      response =
        conn
        |> post(Routes.user_path(conn, :create, @create_attrs))
        |> json_response(201)

      assert %{
               "message" => "User created!",
               "token" => _token,
               "user" => %{"id" => _id, "username" => "test"}
             } = response
    end
  end

  describe "update" do
    setup %{conn: conn} do
      params = @create_attrs
      {:ok, user} = MyRecipes.create_user(params)
      {:ok, token, _claims} = encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "updates chosen user", %{conn: conn} do
      {:ok, %User{id: id}} = MyRecipes.create_user(@create_attrs)

      response =
        conn
        |> put(Routes.user_path(conn, :update, id), @create_attrs)
        |> json_response(:ok)

      %{"user" => user} = response

      assert %{"id" => _id, "recipes" => _recipes, "username" => "test"} = user
    end
  end

  describe "delete" do
    setup %{conn: conn} do
      params = @create_attrs
      {:ok, user} = MyRecipes.create_user(params)
      {:ok, token, _claims} = encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "deletes chosen user", %{conn: conn} do
      {:ok, %User{id: id}} = MyRecipes.create_user(@create_attrs)

      conn
      |> delete(Routes.user_path(conn, :delete, id), @create_attrs)
      |> json_response(:ok)

      assert %{"message" => "User with id #{id} deleted!"}
    end
  end
end
