defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create, as: UserCreate

  describe "users querie" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "Bruno", email: "brf146@gmail.com", password: "123456"}

      {:ok, %User{id: user_id}} = UserCreate.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "brf146@gmail.com",
            "name" => "Bruno"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates an user", %{conn: conn} do
      mutation = """
      mutation{
        createUser(input:{
          name: "Bruno", email: "brf147@gmail.com", password: "123456"
        }){
          id
          name
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Bruno"}}} = response
    end
  end
end
