defmodule MaruExampleTest do
  use ExUnit.Case
  use Maru.Test

  doctest MaruExample

  test "GET /v1/auth with existing public_key" do
    assert %{"public_key" => "123"} = get("/v1/auth?public_key=123") |> json_response
  end
end
