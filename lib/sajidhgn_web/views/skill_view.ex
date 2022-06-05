defmodule SajidhgnWeb.SkillView do
  use SajidhgnWeb, :view
  alias SajidhgnWeb.SkillView

  def render("index.json", %{skills: skills}) do
    %{data: render_many(skills, SkillView, "skill.json")}
  end

  def render("show.json", %{skill: skill}) do
    %{data: render_one(skill, SkillView, "skill.json")}
  end

  def render("skill.json", %{skill: skill}) do
    %{
      id: skill.id,
      image: skill.image,
      title: skill.title,
      description: skill.description
    }
  end
end
