defmodule SajidhgnWeb.Pr_ServiceControllerTest do
  use SajidhgnWeb.ConnCase

  import Sajidhgn.Pr_ServicesFixtures

  alias Sajidhgn.Pr_Services.Pr_Service

  @create_attrs %{
    description: "some description",
    icon: "some icon",
    title: "some title"
  }
  @update_attrs %{
    description: "some updated description",
    icon: "some updated icon",
    title: "some updated title"
  }
  @invalid_attrs %{description: nil, icon: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pr_services", %{conn: conn} do
      conn = get(conn, Routes.pr__service_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pr__service" do
    test "renders pr__service when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pr__service_path(conn, :create), pr__service: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pr__service_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "icon" => "some icon",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pr__service_path(conn, :create), pr__service: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pr__service" do
    setup [:create_pr__service]

    test "renders pr__service when data is valid", %{conn: conn, pr__service: %Pr_Service{id: id} = pr__service} do
      conn = put(conn, Routes.pr__service_path(conn, :update, pr__service), pr__service: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pr__service_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "icon" => "some updated icon",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pr__service: pr__service} do
      conn = put(conn, Routes.pr__service_path(conn, :update, pr__service), pr__service: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pr__service" do
    setup [:create_pr__service]

    test "deletes chosen pr__service", %{conn: conn, pr__service: pr__service} do
      conn = delete(conn, Routes.pr__service_path(conn, :delete, pr__service))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pr__service_path(conn, :show, pr__service))
      end
    end
  end

  defp create_pr__service(_) do
    pr__service = pr__service_fixture()
    %{pr__service: pr__service}
  end
end
