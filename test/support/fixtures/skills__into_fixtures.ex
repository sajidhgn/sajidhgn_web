defmodule Sajidhgn.Skills_IntoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Skills_Into` context.
  """

  @doc """
  Generate a skill__intro.
  """
  def skill__intro_fixture(attrs \\ %{}) do
    {:ok, skill__intro} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        title: "some title"
      })
      |> Sajidhgn.Skills_Into.create_skill__intro()

    skill__intro
  end
end
