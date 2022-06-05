defmodule Sajidhgn.Intro_Services.Intro_Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "intro_services" do
    field :description, :string
    field :icon, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(intro__service, attrs) do
    intro__service
    |> cast(attrs, [:title, :icon, :description])
    |> validate_required([:title, :icon, :description])
  end
end
