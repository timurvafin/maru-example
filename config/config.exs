use Mix.Config

config :maru, MaruExample.Api,
  http: [port: {:system, "PORT"}]