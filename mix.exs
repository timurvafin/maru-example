defmodule MaruExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :maru_example,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:maru],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:maru, "~> 0.13"},
      {:cowboy, "~> 2.3"},
      {:jason, "~> 1.0"},
    ]
  end
end
