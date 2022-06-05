defmodule Sajidhgn.ServicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Services` context.
  """

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        main_description: "some main_description",
        main_title: "some main_title"
      })
      |> Sajidhgn.Services.create_service()

    service
  end
end
