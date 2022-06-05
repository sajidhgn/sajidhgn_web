defmodule Sajidhgn.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :phone, :string
      add :email, :string

      timestamps()
    end
  end
end
