defmodule SajidhgnWeb.IntroductionControllerTest do
  use SajidhgnWeb.ConnCase

  import Sajidhgn.IntroductionsFixtures

  alias Sajidhgn.Introductions.Introduction

  @create_attrs %{
    designation: "some designation",
    name: "some name"
  }
  @update_attrs %{
    designation: "some updated designation",
    name: "some updated name"
  }
  @invalid_attrs %{designation: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all introduction", %{conn: conn} do
      conn = get(conn, Routes.introduction_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create introduction" do
    test "renders introduction when data is valid", %{conn: conn} do
      conn = post(conn, Routes.introduction_path(conn, :create), introduction: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.introduction_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "designation" => "some designation",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.introduction_path(conn, :create), introduction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update introduction" do
    setup [:create_introduction]

    test "renders introduction when data is valid", %{conn: conn, introduction: %Introduction{id: id} = introduction} do
      conn = put(conn, Routes.introduction_path(conn, :update, introduction), introduction: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.introduction_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "designation" => "some updated designation",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, introduction: introduction} do
      conn = put(conn, Routes.introduction_path(conn, :update, introduction), introduction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete introduction" do
    setup [:create_introduction]

    test "deletes chosen introduction", %{conn: conn, introduction: introduction} do
      conn = delete(conn, Routes.introduction_path(conn, :delete, introduction))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.introduction_path(conn, :show, introduction))
      end
    end
  end

  defp create_introduction(_) do
    introduction = introduction_fixture()
    %{introduction: introduction}
  end
end
