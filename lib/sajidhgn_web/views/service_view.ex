defmodule SajidhgnWeb.ServiceView do
  use SajidhgnWeb, :view
  alias SajidhgnWeb.ServiceView

  def render("index.json", %{services: services}) do
    %{data: render_many(services, ServiceView, "service.json")}
  end

  def render("show.json", %{service: service}) do
    %{data: render_one(service, ServiceView, "service.json")}
  end

  def render("service.json", %{service: service}) do
    %{
      id: service.id,
      main_title: service.main_title,
      main_description: service.main_description
    }
  end
end
