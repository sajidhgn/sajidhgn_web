defmodule Sajidhgn.Skills_Into.Skill_Intro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills_intro" do
    field :description, :string
    field :image, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(skill__intro, attrs) do
    skill__intro
    |> cast(attrs, [:image, :title, :description])
    |> validate_required([:image, :title, :description])
  end
end
