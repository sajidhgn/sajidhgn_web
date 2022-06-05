defmodule Sajidhgn.ServicesTest do
  use Sajidhgn.DataCase

  alias Sajidhgn.Services

  describe "services" do
    alias Sajidhgn.Services.Service

    import Sajidhgn.ServicesFixtures

    @invalid_attrs %{main_description: nil, main_title: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Services.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Services.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{main_description: "some main_description", main_title: "some main_title"}

      assert {:ok, %Service{} = service} = Services.create_service(valid_attrs)
      assert service.main_description == "some main_description"
      assert service.main_title == "some main_title"
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Services.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{main_description: "some updated main_description", main_title: "some updated main_title"}

      assert {:ok, %Service{} = service} = Services.update_service(service, update_attrs)
      assert service.main_description == "some updated main_description"
      assert service.main_title == "some updated main_title"
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Services.update_service(service, @invalid_attrs)
      assert service == Services.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Services.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Services.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Services.change_service(service)
    end
  end
end
