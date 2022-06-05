defmodule Sajidhgn.Skills_IntoTest do
  use Sajidhgn.DataCase

  alias Sajidhgn.Skills_Into

  describe "skills_intro" do
    alias Sajidhgn.Skills_Into.Skill_Intro

    import Sajidhgn.Skills_IntoFixtures

    @invalid_attrs %{description: nil, image: nil, title: nil}

    test "list_skills_intro/0 returns all skills_intro" do
      skill__intro = skill__intro_fixture()
      assert Skills_Into.list_skills_intro() == [skill__intro]
    end

    test "get_skill__intro!/1 returns the skill__intro with given id" do
      skill__intro = skill__intro_fixture()
      assert Skills_Into.get_skill__intro!(skill__intro.id) == skill__intro
    end

    test "create_skill__intro/1 with valid data creates a skill__intro" do
      valid_attrs = %{description: "some description", image: "some image", title: "some title"}

      assert {:ok, %Skill_Intro{} = skill__intro} = Skills_Into.create_skill__intro(valid_attrs)
      assert skill__intro.description == "some description"
      assert skill__intro.image == "some image"
      assert skill__intro.title == "some title"
    end

    test "create_skill__intro/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Skills_Into.create_skill__intro(@invalid_attrs)
    end

    test "update_skill__intro/2 with valid data updates the skill__intro" do
      skill__intro = skill__intro_fixture()
      update_attrs = %{description: "some updated description", image: "some updated image", title: "some updated title"}

      assert {:ok, %Skill_Intro{} = skill__intro} = Skills_Into.update_skill__intro(skill__intro, update_attrs)
      assert skill__intro.description == "some updated description"
      assert skill__intro.image == "some updated image"
      assert skill__intro.title == "some updated title"
    end

    test "update_skill__intro/2 with invalid data returns error changeset" do
      skill__intro = skill__intro_fixture()
      assert {:error, %Ecto.Changeset{}} = Skills_Into.update_skill__intro(skill__intro, @invalid_attrs)
      assert skill__intro == Skills_Into.get_skill__intro!(skill__intro.id)
    end

    test "delete_skill__intro/1 deletes the skill__intro" do
      skill__intro = skill__intro_fixture()
      assert {:ok, %Skill_Intro{}} = Skills_Into.delete_skill__intro(skill__intro)
      assert_raise Ecto.NoResultsError, fn -> Skills_Into.get_skill__intro!(skill__intro.id) end
    end

    test "change_skill__intro/1 returns a skill__intro changeset" do
      skill__intro = skill__intro_fixture()
      assert %Ecto.Changeset{} = Skills_Into.change_skill__intro(skill__intro)
    end
  end
end
