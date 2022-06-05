defmodule Sajidhgn.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :main_description, :string
    field :main_title, :string

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:main_title, :main_description])
    |> validate_required([:main_title, :main_description])
  end
end
