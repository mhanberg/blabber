defmodule BlabberWeb.PageController do
  use BlabberWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
