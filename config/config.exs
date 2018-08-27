use Mix.Config

config :maru, MaruExample.Api,
  versioning: [ using: :path ],
  http: [
    port: { :system, "PORT", 3000 },
    bind_addr: { :system, "IP", "0.0.0.0" },
  ]
