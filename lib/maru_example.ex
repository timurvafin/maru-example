defmodule MaruExample do
end

defmodule MaruExample.Api do
  use Maru.Router

  plug Plug.RequestId

  plug Plug.Logger,
    log: :debug

  plug Plug.Parsers,
    pass: ["*/*"],
    json_decoder: Jason,
    parsers: [:urlencoded, :json]

  version "v1"

  namespace :auth do

    desc "Request challenge message"
    params do
      requires :public_key, type: :string
    end
    get do
      # find device by public key in the db
      # generate random message
      # save random message in the db
      # respond with it
      conn |> json(%{ public_key: params[:public_key] })
    end

    desc "Request challenge message"
    params do
      requires :public_key, type: :string
      requires :signature, type: :string
    end
    post do
      # find device by public key in the db
      {:ok, device} = Repo.get_by(Device, public_key: public_key)

      # verify timestamp for random challenge
      # TODO

      # verify the signature
      rsa_pub_key = ExPublicKey.load!("/path/to/public_key.pem")
      {:ok, sig_valid} = ExPublicKey.verify(device.last_auth_challenge, signature, rsa_pub_key)

      # genrate JWT
      {:ok, token, claims} = MyApp.Guardian.encode_and_sign(device)

      # respond with JWT
      conn |> json(%{ token: token })
    end

  end

  rescue_from Maru.Exceptions.InvalidFormat do
    conn
    |> put_status(400)
    |> json(%{ error: "Invalid public key" })
  end
end
