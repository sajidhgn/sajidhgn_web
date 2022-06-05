defmodule Sajidhgn.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :skill, :string
      add :completion, :string

      timestamps()
    end
  end
end
