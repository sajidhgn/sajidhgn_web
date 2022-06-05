defmodule SajidhgnWeb.Skill_IntroController do
  use SajidhgnWeb, :controller

  alias Sajidhgn.Skills_Into
  alias Sajidhgn.Skills_Into.Skill_Intro

  action_fallback SajidhgnWeb.FallbackController

  def index(conn, _params) do
    skills_intro = Skills_Into.list_skills_intro()
    render(conn, "index.json", skills_intro: skills_intro)
  end

  def create(conn, %{"skill__intro" => skill__intro_params}) do
    with {:ok, %Skill_Intro{} = skill__intro} <- Skills_Into.create_skill__intro(skill__intro_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.skill__intro_path(conn, :show, skill__intro))
      |> render("show.json", skill__intro: skill__intro)
    end
  end

  def show(conn, %{"id" => id}) do
    skill__intro = Skills_Into.get_skill__intro!(id)
    render(conn, "show.json", skill__intro: skill__intro)
  end

  def update(conn, %{"id" => id, "skill__intro" => skill__intro_params}) do
    skill__intro = Skills_Into.get_skill__intro!(id)

    with {:ok, %Skill_Intro{} = skill__intro} <- Skills_Into.update_skill__intro(skill__intro, skill__intro_params) do
      render(conn, "show.json", skill__intro: skill__intro)
    end
  end

  def delete(conn, %{"id" => id}) do
    skill__intro = Skills_Into.get_skill__intro!(id)

    with {:ok, %Skill_Intro{}} <- Skills_Into.delete_skill__intro(skill__intro) do
      send_resp(conn, :no_content, "")
    end
  end
end
