defmodule SajidhgnWeb.ContactView do
  use SajidhgnWeb, :view
  alias SajidhgnWeb.ContactView

  def render("index.json", %{contacts: contacts}) do
    %{data: render_many(contacts, ContactView, "contact.json")}
  end

  def render("show.json", %{contact: contact}) do
    %{data: render_one(contact, ContactView, "contact.json")}
  end

  def render("contact.json", %{contact: contact}) do
    %{
      id: contact.id,
      phone: contact.phone,
      email: contact.email
    }
  end
end
