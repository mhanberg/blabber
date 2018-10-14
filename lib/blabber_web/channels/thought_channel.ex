defmodule BlabberWeb.ThoughtChannel do
  use BlabberWeb, :channel

  def join("thought:public", _m, socket) do
    {:ok, socket}
  end

  def handle_in("new_thought", %{"author" => author, "body" => body}, socket) do
    {:ok, thought} = Blabber.Thoughts.create_thought(%{author: author, body: body})

    template = Phoenix.View.render_to_string(BlabberWeb.ThoughtView, "thought.html", thought: thought)

    broadcast!(socket, "new_thought", %{template: template})

    {:noreply, socket}
  end
end
