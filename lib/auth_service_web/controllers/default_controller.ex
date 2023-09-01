defmodule AuthServiceWeb.DefaultController do
    use AuthServiceWeb, :controller

    def index(conn, _params) do
        text conn, "The Auth Service is Live - #{Mix.env()}"
    end

end