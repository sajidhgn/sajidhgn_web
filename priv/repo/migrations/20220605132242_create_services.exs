defmodule Sajidhgn.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :title, :string
      add :icon, :string
      add :description, :string
      timestamps()
    end
  end
end
