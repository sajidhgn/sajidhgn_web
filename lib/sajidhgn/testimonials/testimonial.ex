defmodule Sajidhgn.Testimonials.Testimonial do
  use Ecto.Schema
  import Ecto.Changeset

  schema "testimonials" do
    field :description, :string
    field :designation, :string
    field :image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(testimonial, attrs) do
    testimonial
    |> cast(attrs, [:image, :name, :designation, :description])
    |> validate_required([:image, :name, :designation, :description])
  end
end
