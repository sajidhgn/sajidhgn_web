defmodule Sajidhgn.IntroductionsTest do
  use Sajidhgn.DataCase

  alias Sajidhgn.Introductions

  describe "introduction" do
    alias Sajidhgn.Introductions.Introduction

    import Sajidhgn.IntroductionsFixtures

    @invalid_attrs %{designation: nil, name: nil}

    test "list_introduction/0 returns all introduction" do
      introduction = introduction_fixture()
      assert Introductions.list_introduction() == [introduction]
    end

    test "get_introduction!/1 returns the introduction with given id" do
      introduction = introduction_fixture()
      assert Introductions.get_introduction!(introduction.id) == introduction
    end

    test "create_introduction/1 with valid data creates a introduction" do
      valid_attrs = %{designation: "some designation", name: "some name"}

      assert {:ok, %Introduction{} = introduction} = Introductions.create_introduction(valid_attrs)
      assert introduction.designation == "some designation"
      assert introduction.name == "some name"
    end

    test "create_introduction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Introductions.create_introduction(@invalid_attrs)
    end

    test "update_introduction/2 with valid data updates the introduction" do
      introduction = introduction_fixture()
      update_attrs = %{designation: "some updated designation", name: "some updated name"}

      assert {:ok, %Introduction{} = introduction} = Introductions.update_introduction(introduction, update_attrs)
      assert introduction.designation == "some updated designation"
      assert introduction.name == "some updated name"
    end

    test "update_introduction/2 with invalid data returns error changeset" do
      introduction = introduction_fixture()
      assert {:error, %Ecto.Changeset{}} = Introductions.update_introduction(introduction, @invalid_attrs)
      assert introduction == Introductions.get_introduction!(introduction.id)
    end

    test "delete_introduction/1 deletes the introduction" do
      introduction = introduction_fixture()
      assert {:ok, %Introduction{}} = Introductions.delete_introduction(introduction)
      assert_raise Ecto.NoResultsError, fn -> Introductions.get_introduction!(introduction.id) end
    end

    test "change_introduction/1 returns a introduction changeset" do
      introduction = introduction_fixture()
      assert %Ecto.Changeset{} = Introductions.change_introduction(introduction)
    end
  end
end
