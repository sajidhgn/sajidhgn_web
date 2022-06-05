defmodule Sajidhgn.TestimonialsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Testimonials` context.
  """

  @doc """
  Generate a testimonial.
  """
  def testimonial_fixture(attrs \\ %{}) do
    {:ok, testimonial} =
      attrs
      |> Enum.into(%{
        description: "some description",
        designation: "some designation",
        image: "some image",
        name: "some name"
      })
      |> Sajidhgn.Testimonials.create_testimonial()

    testimonial
  end
end
