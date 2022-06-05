defmodule Sajidhgn.Repo.Migrations.CreateTimelines do
  use Ecto.Migration

  def change do
    create table(:timelines) do
      add :title, :string
      add :description, :string
      add :date, :string

      timestamps()
    end
  end
end
