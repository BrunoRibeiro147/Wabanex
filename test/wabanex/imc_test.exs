defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists return the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Bruno" => 27.39817568244846,
           "Diego" => 22.783308885490467,
           "Gabul" => 22.857142857142858,
           "Rafael" => 24.897060231734173
         }}

      assert expected_response == response
    end

    test "when the wrong filename is given return an error" do
      params = %{"filename" => "students2.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert expected_response == response
    end
  end
end
