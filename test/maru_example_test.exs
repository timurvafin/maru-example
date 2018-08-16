defmodule MaruExampleTest do
  use ExUnit.Case
  doctest MaruExample

  test "greets the world" do
    assert MaruExample.hello() == :world
  end
end
