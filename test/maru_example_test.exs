defmodule MaruExampleTest do
  use Maru.Test

  test "/" do
    assert "hello" = get("/") |> text_response
  end
end
