defmodule Sajidhgn.Pr_ServicesTest do
  use Sajidhgn.DataCase

  alias Sajidhgn.Pr_Services

  describe "pr_services" do
    alias Sajidhgn.Pr_Services.Pr_Service

    import Sajidhgn.Pr_ServicesFixtures

    @invalid_attrs %{description: nil, icon: nil, title: nil}

    test "list_pr_services/0 returns all pr_services" do
      pr__service = pr__service_fixture()
      assert Pr_Services.list_pr_services() == [pr__service]
    end

    test "get_pr__service!/1 returns the pr__service with given id" do
      pr__service = pr__service_fixture()
      assert Pr_Services.get_pr__service!(pr__service.id) == pr__service
    end

    test "create_pr__service/1 with valid data creates a pr__service" do
      valid_attrs = %{description: "some description", icon: "some icon", title: "some title"}

      assert {:ok, %Pr_Service{} = pr__service} = Pr_Services.create_pr__service(valid_attrs)
      assert pr__service.description == "some description"
      assert pr__service.icon == "some icon"
      assert pr__service.title == "some title"
    end

    test "create_pr__service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pr_Services.create_pr__service(@invalid_attrs)
    end

    test "update_pr__service/2 with valid data updates the pr__service" do
      pr__service = pr__service_fixture()
      update_attrs = %{description: "some updated description", icon: "some updated icon", title: "some updated title"}

      assert {:ok, %Pr_Service{} = pr__service} = Pr_Services.update_pr__service(pr__service, update_attrs)
      assert pr__service.description == "some updated description"
      assert pr__service.icon == "some updated icon"
      assert pr__service.title == "some updated title"
    end

    test "update_pr__service/2 with invalid data returns error changeset" do
      pr__service = pr__service_fixture()
      assert {:error, %Ecto.Changeset{}} = Pr_Services.update_pr__service(pr__service, @invalid_attrs)
      assert pr__service == Pr_Services.get_pr__service!(pr__service.id)
    end

    test "delete_pr__service/1 deletes the pr__service" do
      pr__service = pr__service_fixture()
      assert {:ok, %Pr_Service{}} = Pr_Services.delete_pr__service(pr__service)
      assert_raise Ecto.NoResultsError, fn -> Pr_Services.get_pr__service!(pr__service.id) end
    end

    test "change_pr__service/1 returns a pr__service changeset" do
      pr__service = pr__service_fixture()
      assert %Ecto.Changeset{} = Pr_Services.change_pr__service(pr__service)
    end
  end
end
