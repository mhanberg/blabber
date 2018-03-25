defmodule BlabberWeb.ThoughtChannel do
  use BlabberWeb, :channel

  def join("thought:public", _m, socket) do
    {:ok, socket}
  end

  def handle_in("new_thought", %{"author" => author, "body" => body}, socket) do
    {:ok, thought} = Blabber.Thoughts.create_thought(%{author: author, body: body})

    broadcast!(socket, "new_thought", thought)

    {:noreply, socket}
  end
end
