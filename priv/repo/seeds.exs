# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blabber.Repo.insert!(%Blabber.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for name <- ["alice", "bob", "carol", "dave"],
    message <- ["Hi, I'm #{name}!", "Chipotle is SO good", "Does anyone else breathe?"] do
  Blabber.Thoughts.create_thought(%{author: name, body: message})
end
