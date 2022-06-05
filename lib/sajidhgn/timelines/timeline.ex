defmodule Sajidhgn.Timelines.Timeline do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timelines" do
    field :date, :string
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(timeline, attrs) do
    timeline
    |> cast(attrs, [:title, :description, :date])
    |> validate_required([:title, :description, :date])
  end
end
