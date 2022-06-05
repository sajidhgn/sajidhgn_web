defmodule Sajidhgn.ContactsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Contacts` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        email: "some email",
        phone: "some phone"
      })
      |> Sajidhgn.Contacts.create_contact()

    contact
  end
end
