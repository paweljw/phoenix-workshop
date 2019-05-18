defmodule Beeper.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :text
      add :author_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:posts, [:author_id])
  end
end
