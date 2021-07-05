defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Bruno" => 27.39817568244846,
          "Diego" => 22.783308885490467,
          "Gabul" => 22.857142857142858,
          "Rafael" => 24.897060231734173
        }
      }

      assert expected_response == response
    end

    test "when there are invalide params, returns a error", %{conn: conn} do
      params = %{"filename" => "students2.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert expected_response == response
    end
  end
end
