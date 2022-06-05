defmodule SajidhgnWeb.Intro_ServiceView do
  use SajidhgnWeb, :view
  alias SajidhgnWeb.Intro_ServiceView

  def render("index.json", %{intro_services: intro_services}) do
    %{data: render_many(intro_services, Intro_ServiceView, "intro__service.json")}
  end

  def render("show.json", %{intro__service: intro__service}) do
    %{data: render_one(intro__service, Intro_ServiceView, "intro__service.json")}
  end

  def render("intro__service.json", %{intro__service: intro__service}) do
    %{
      id: intro__service.id,
      title: intro__service.title,
      icon: intro__service.icon,
      description: intro__service.description
    }
  end
end
