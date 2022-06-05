defmodule Sajidhgn.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :description, :string
    field :image, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:image, :title, :description])
    |> validate_required([:image, :title, :description])
  end
end
