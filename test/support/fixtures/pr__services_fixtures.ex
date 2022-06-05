defmodule Sajidhgn.Pr_ServicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Pr_Services` context.
  """

  @doc """
  Generate a pr__service.
  """
  def pr__service_fixture(attrs \\ %{}) do
    {:ok, pr__service} =
      attrs
      |> Enum.into(%{
        description: "some description",
        icon: "some icon",
        title: "some title"
      })
      |> Sajidhgn.Pr_Services.create_pr__service()

    pr__service
  end
end
