defmodule Blabber.Thoughts do
  @moduledoc """
  The Thoughts context.
  """

  import Ecto.Query, warn: false
  alias Blabber.Repo

  alias Blabber.Thoughts.Thought

  @doc """
  Returns the list of thoughts.

  ## Examples

      iex> list_thoughts()
      [%Thought{}, ...]

  """
  def list_thoughts do
    Thought
    |> order_by(desc: :inserted_at)
    |> Repo.all()
  end

  @doc """
  Gets a single thought.

  Raises `Ecto.NoResultsError` if the Thought does not exist.

  ## Examples

      iex> get_thought!(123)
      %Thought{}

      iex> get_thought!(456)
      ** (Ecto.NoResultsError)

  """
  def get_thought!(id), do: Repo.get!(Thought, id)

  @doc """
  Creates a thought.

  ## Examples

      iex> create_thought(%{field: value})
      {:ok, %Thought{}}

      iex> create_thought(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_thought(attrs \\ %{}) do
    %Thought{}
    |> Thought.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a thought.

  ## Examples

      iex> update_thought(thought, %{field: new_value})
      {:ok, %Thought{}}

      iex> update_thought(thought, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_thought(%Thought{} = thought, attrs) do
    thought
    |> Thought.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Thought.

  ## Examples

      iex> delete_thought(thought)
      {:ok, %Thought{}}

      iex> delete_thought(thought)
      {:error, %Ecto.Changeset{}}

  """
  def delete_thought(%Thought{} = thought) do
    Repo.delete(thought)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking thought changes.

  ## Examples

      iex> change_thought(thought)
      %Ecto.Changeset{source: %Thought{}}

  """
  def change_thought(%Thought{} = thought) do
    Thought.changeset(thought, %{})
  end
end
