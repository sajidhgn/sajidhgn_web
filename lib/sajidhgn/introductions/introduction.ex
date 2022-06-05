defmodule Sajidhgn.Introductions.Introduction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "introduction" do
    field :designation, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(introduction, attrs) do
    introduction
    |> cast(attrs, [:name, :designation])
    |> validate_required([:name, :designation])
  end
end
