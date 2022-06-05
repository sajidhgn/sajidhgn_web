defmodule Sajidhgn.Portfolios.Portfolio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "portfolios" do
    field :category, :string
    field :image, :string

    timestamps()
  end

  @doc false
  def changeset(portfolio, attrs) do
    portfolio
    |> cast(attrs, [:image, :category])
    |> validate_required([:image, :category])
  end
end
