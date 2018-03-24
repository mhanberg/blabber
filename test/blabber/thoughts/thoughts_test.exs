defmodule Blabber.ThoughtsTest do
  use Blabber.DataCase

  alias Blabber.Thoughts

  describe "thoughts" do
    alias Blabber.Thoughts.Thought

    @valid_attrs %{author: "some author", body: "some body"}
    @update_attrs %{author: "some updated author", body: "some updated body"}
    @invalid_attrs %{author: nil, body: nil}

    def thought_fixture(attrs \\ %{}) do
      {:ok, thought} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Thoughts.create_thought()

      thought
    end

    test "list_thoughts/0 returns all thoughts" do
      thought = thought_fixture()
      assert Thoughts.list_thoughts() == [thought]
    end

    test "get_thought!/1 returns the thought with given id" do
      thought = thought_fixture()
      assert Thoughts.get_thought!(thought.id) == thought
    end

    test "create_thought/1 with valid data creates a thought" do
      assert {:ok, %Thought{} = thought} = Thoughts.create_thought(@valid_attrs)
      assert thought.author == "some author"
      assert thought.body == "some body"
    end

    test "create_thought/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Thoughts.create_thought(@invalid_attrs)
    end

    test "update_thought/2 with valid data updates the thought" do
      thought = thought_fixture()
      assert {:ok, thought} = Thoughts.update_thought(thought, @update_attrs)
      assert %Thought{} = thought
      assert thought.author == "some updated author"
      assert thought.body == "some updated body"
    end

    test "update_thought/2 with invalid data returns error changeset" do
      thought = thought_fixture()
      assert {:error, %Ecto.Changeset{}} = Thoughts.update_thought(thought, @invalid_attrs)
      assert thought == Thoughts.get_thought!(thought.id)
    end

    test "delete_thought/1 deletes the thought" do
      thought = thought_fixture()
      assert {:ok, %Thought{}} = Thoughts.delete_thought(thought)
      assert_raise Ecto.NoResultsError, fn -> Thoughts.get_thought!(thought.id) end
    end

    test "change_thought/1 returns a thought changeset" do
      thought = thought_fixture()
      assert %Ecto.Changeset{} = Thoughts.change_thought(thought)
    end
  end
end
