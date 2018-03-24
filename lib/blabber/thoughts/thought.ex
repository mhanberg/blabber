defmodule Blabber.Thoughts.Thought do
  use Ecto.Schema
  import Ecto.Changeset


  schema "thoughts" do
    field :author, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(thought, attrs) do
    thought
    |> cast(attrs, [:author, :body])
    |> validate_required([:author, :body])
  end
end
