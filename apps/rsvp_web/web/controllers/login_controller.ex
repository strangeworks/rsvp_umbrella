defmodule RsvpWeb.LoginController do
  use RsvpWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login(conn, %{"login" => %{"username" => name}}) do
    expiration = 60 * 60 * 7
    conn
    |> Plug.Conn.put_resp_cookie("user_name", name, max_age: expiration)
    |> redirect(to: "/")
  end
end
