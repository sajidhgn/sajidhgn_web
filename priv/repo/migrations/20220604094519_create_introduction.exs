defmodule Sajidhgn.Repo.Migrations.CreateIntroduction do
  use Ecto.Migration

  def change do
    create table(:introduction) do
      add :name, :string
      add :designation, :string
      add :about_title, :string
      add :about_image, :string
      add :about_description, :string

      timestamps()
    end
  end
end
