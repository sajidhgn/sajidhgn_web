defmodule Sajidhgn.TimelinesTest do
  use Sajidhgn.DataCase

  alias Sajidhgn.Timelines

  describe "timelines" do
    alias Sajidhgn.Timelines.Timeline

    import Sajidhgn.TimelinesFixtures

    @invalid_attrs %{date: nil, description: nil, title: nil}

    test "list_timelines/0 returns all timelines" do
      timeline = timeline_fixture()
      assert Timelines.list_timelines() == [timeline]
    end

    test "get_timeline!/1 returns the timeline with given id" do
      timeline = timeline_fixture()
      assert Timelines.get_timeline!(timeline.id) == timeline
    end

    test "create_timeline/1 with valid data creates a timeline" do
      valid_attrs = %{date: "some date", description: "some description", title: "some title"}

      assert {:ok, %Timeline{} = timeline} = Timelines.create_timeline(valid_attrs)
      assert timeline.date == "some date"
      assert timeline.description == "some description"
      assert timeline.title == "some title"
    end

    test "create_timeline/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timelines.create_timeline(@invalid_attrs)
    end

    test "update_timeline/2 with valid data updates the timeline" do
      timeline = timeline_fixture()
      update_attrs = %{date: "some updated date", description: "some updated description", title: "some updated title"}

      assert {:ok, %Timeline{} = timeline} = Timelines.update_timeline(timeline, update_attrs)
      assert timeline.date == "some updated date"
      assert timeline.description == "some updated description"
      assert timeline.title == "some updated title"
    end

    test "update_timeline/2 with invalid data returns error changeset" do
      timeline = timeline_fixture()
      assert {:error, %Ecto.Changeset{}} = Timelines.update_timeline(timeline, @invalid_attrs)
      assert timeline == Timelines.get_timeline!(timeline.id)
    end

    test "delete_timeline/1 deletes the timeline" do
      timeline = timeline_fixture()
      assert {:ok, %Timeline{}} = Timelines.delete_timeline(timeline)
      assert_raise Ecto.NoResultsError, fn -> Timelines.get_timeline!(timeline.id) end
    end

    test "change_timeline/1 returns a timeline changeset" do
      timeline = timeline_fixture()
      assert %Ecto.Changeset{} = Timelines.change_timeline(timeline)
    end
  end
end
