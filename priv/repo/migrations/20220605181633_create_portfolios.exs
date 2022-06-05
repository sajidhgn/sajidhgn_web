defmodule Sajidhgn.Repo.Migrations.CreatePortfolios do
  use Ecto.Migration

  def change do
    create table(:portfolios) do
      add :image, :string
      add :category, :string

      timestamps()
    end
  end
end
