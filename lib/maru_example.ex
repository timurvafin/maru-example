defmodule MaruExample do
end

defmodule MaruExample.Api do
  use Maru.Router
  plug Plug.Logger

  get do
    conn |> text("It works!")
  end
end
