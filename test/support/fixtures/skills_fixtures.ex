defmodule Sajidhgn.SkillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Skills` context.
  """

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        title: "some title"
      })
      |> Sajidhgn.Skills.create_skill()

    skill
  end
end
