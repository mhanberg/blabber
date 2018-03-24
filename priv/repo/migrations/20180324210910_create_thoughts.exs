defmodule Blabber.Repo.Migrations.CreateThoughts do
  use Ecto.Migration

  def change do
    create table(:thoughts) do
      add :author, :string
      add :body, :text

      timestamps()
    end

  end
end
