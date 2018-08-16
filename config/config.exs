use Mix.Config

config :maru, MaruExample.Api,
  http: [
    port: {:system, "PORT"},
    bind_addr: "0.0.0.0",
  ]
