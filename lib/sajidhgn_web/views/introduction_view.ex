defmodule SajidhgnWeb.IntroductionView do
  use SajidhgnWeb, :view
  alias SajidhgnWeb.IntroductionView

  def render("index.json", %{introduction: introduction}) do
    %{data: render_many(introduction, IntroductionView, "introduction.json")}
  end

  def render("show.json", %{introduction: introduction}) do
    %{data: render_one(introduction, IntroductionView, "introduction.json")}
  end

  def render("introduction.json", %{introduction: introduction}) do
    %{
      id: introduction.id,
      name: introduction.name,
      designation: introduction.designation
    }
  end
end
