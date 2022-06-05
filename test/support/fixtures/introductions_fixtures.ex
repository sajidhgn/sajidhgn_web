defmodule Sajidhgn.IntroductionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Introductions` context.
  """

  @doc """
  Generate a introduction.
  """
  def introduction_fixture(attrs \\ %{}) do
    {:ok, introduction} =
      attrs
      |> Enum.into(%{
        designation: "some designation",
        name: "some name"
      })
      |> Sajidhgn.Introductions.create_introduction()

    introduction
  end
end
