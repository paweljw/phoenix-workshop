defmodule Beeper.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :name, :string
      add :email, :string
      # authenticatable
      add :password_hash, :string
      # trackable
      add :sign_in_count, :integer, default: 0
      add :current_sign_in_at, :utc_datetime
      add :last_sign_in_at, :utc_datetime
      add :current_sign_in_ip, :string
      add :last_sign_in_ip, :string
      # unlockable_with_token
      add :unlock_token, :string
      
      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
