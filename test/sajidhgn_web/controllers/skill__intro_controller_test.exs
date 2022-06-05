defmodule SajidhgnWeb.Skill_IntroControllerTest do
  use SajidhgnWeb.ConnCase

  import Sajidhgn.Skills_IntoFixtures

  alias Sajidhgn.Skills_Into.Skill_Intro

  @create_attrs %{
    description: "some description",
    image: "some image",
    title: "some title"
  }
  @update_attrs %{
    description: "some updated description",
    image: "some updated image",
    title: "some updated title"
  }
  @invalid_attrs %{description: nil, image: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all skills_intro", %{conn: conn} do
      conn = get(conn, Routes.skill__intro_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create skill__intro" do
    test "renders skill__intro when data is valid", %{conn: conn} do
      conn = post(conn, Routes.skill__intro_path(conn, :create), skill__intro: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.skill__intro_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "image" => "some image",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.skill__intro_path(conn, :create), skill__intro: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update skill__intro" do
    setup [:create_skill__intro]

    test "renders skill__intro when data is valid", %{conn: conn, skill__intro: %Skill_Intro{id: id} = skill__intro} do
      conn = put(conn, Routes.skill__intro_path(conn, :update, skill__intro), skill__intro: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.skill__intro_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "image" => "some updated image",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, skill__intro: skill__intro} do
      conn = put(conn, Routes.skill__intro_path(conn, :update, skill__intro), skill__intro: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete skill__intro" do
    setup [:create_skill__intro]

    test "deletes chosen skill__intro", %{conn: conn, skill__intro: skill__intro} do
      conn = delete(conn, Routes.skill__intro_path(conn, :delete, skill__intro))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.skill__intro_path(conn, :show, skill__intro))
      end
    end
  end

  defp create_skill__intro(_) do
    skill__intro = skill__intro_fixture()
    %{skill__intro: skill__intro}
  end
end
