defmodule SajidhgnWeb.IntroductionController do
  use SajidhgnWeb, :controller

  alias Sajidhgn.Introductions
  alias Sajidhgn.Introductions.Introduction

  action_fallback SajidhgnWeb.FallbackController

  def index(conn, _params) do
    introduction = Introductions.list_introduction()
    render(conn, "index.json", introduction: introduction)
  end

  def create(conn, %{"introduction" => introduction_params}) do
    with {:ok, %Introduction{} = introduction} <- Introductions.create_introduction(introduction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.introduction_path(conn, :show, introduction))
      |> render("show.json", introduction: introduction)
    end
  end

  def show(conn, %{"id" => id}) do
    introduction = Introductions.get_introduction!(id)
    render(conn, "show.json", introduction: introduction)
  end

  def update(conn, %{"id" => id, "introduction" => introduction_params}) do
    introduction = Introductions.get_introduction!(id)

    with {:ok, %Introduction{} = introduction} <- Introductions.update_introduction(introduction, introduction_params) do
      render(conn, "show.json", introduction: introduction)
    end
  end

  def delete(conn, %{"id" => id}) do
    introduction = Introductions.get_introduction!(id)

    with {:ok, %Introduction{}} <- Introductions.delete_introduction(introduction) do
      send_resp(conn, :no_content, "")
    end
  end
end
