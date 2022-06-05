defmodule Sajidhgn.Repo.Migrations.CreateSkillsIntro do
  use Ecto.Migration

  def change do
    create table(:skills_intro) do
      add :image, :string
      add :title, :string
      add :description, :string

      timestamps()
    end
  end
end
