defmodule MaruExample do
end

defmodule MaruExample.Api do
  use Maru.Router

  get do
    conn |> text("It works!")
  end
end
