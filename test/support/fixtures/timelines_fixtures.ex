defmodule Sajidhgn.TimelinesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Timelines` context.
  """

  @doc """
  Generate a timeline.
  """
  def timeline_fixture(attrs \\ %{}) do
    {:ok, timeline} =
      attrs
      |> Enum.into(%{
        date: "some date",
        description: "some description",
        title: "some title"
      })
      |> Sajidhgn.Timelines.create_timeline()

    timeline
  end
end
