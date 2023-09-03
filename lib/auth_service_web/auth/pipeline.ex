defmodule AuthServiceWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :auth_service,
  module: AuthServiceWeb.Auth.Guardian,
  error_handler: AuthServiceWeb.Auth.GuardianErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource

end
