defmodule BlabberWeb.ThoughtController do
  use BlabberWeb, :controller

  def index(conn, _params) do
    thoughts = Blabber.Thoughts.list_thoughts()

    render conn, "index.html", thoughts: thoughts
  end
end

