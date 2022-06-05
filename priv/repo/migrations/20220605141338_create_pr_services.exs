defmodule Sajidhgn.Repo.Migrations.CreatePrServices do
  use Ecto.Migration

  def change do
    create table(:intro_services) do
      add :main_title, :string
      add :main_description, :string

      timestamps()
    end
  end
end
