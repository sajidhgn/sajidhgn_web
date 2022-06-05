defmodule SajidhgnWeb.Skill_IntroView do
  use SajidhgnWeb, :view
  alias SajidhgnWeb.Skill_IntroView

  def render("index.json", %{skills_intro: skills_intro}) do
    %{data: render_many(skills_intro, Skill_IntroView, "skill__intro.json")}
  end

  def render("show.json", %{skill__intro: skill__intro}) do
    %{data: render_one(skill__intro, Skill_IntroView, "skill__intro.json")}
  end

  def render("skill__intro.json", %{skill__intro: skill__intro}) do
    %{
      id: skill__intro.id,
      image: skill__intro.image,
      title: skill__intro.title,
      description: skill__intro.description
    }
  end
end
