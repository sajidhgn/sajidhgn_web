defmodule Sajidhgn.TestimonialsTest do
  use Sajidhgn.DataCase

  alias Sajidhgn.Testimonials

  describe "testimonials" do
    alias Sajidhgn.Testimonials.Testimonial

    import Sajidhgn.TestimonialsFixtures

    @invalid_attrs %{description: nil, designation: nil, image: nil, name: nil}

    test "list_testimonials/0 returns all testimonials" do
      testimonial = testimonial_fixture()
      assert Testimonials.list_testimonials() == [testimonial]
    end

    test "get_testimonial!/1 returns the testimonial with given id" do
      testimonial = testimonial_fixture()
      assert Testimonials.get_testimonial!(testimonial.id) == testimonial
    end

    test "create_testimonial/1 with valid data creates a testimonial" do
      valid_attrs = %{description: "some description", designation: "some designation", image: "some image", name: "some name"}

      assert {:ok, %Testimonial{} = testimonial} = Testimonials.create_testimonial(valid_attrs)
      assert testimonial.description == "some description"
      assert testimonial.designation == "some designation"
      assert testimonial.image == "some image"
      assert testimonial.name == "some name"
    end

    test "create_testimonial/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Testimonials.create_testimonial(@invalid_attrs)
    end

    test "update_testimonial/2 with valid data updates the testimonial" do
      testimonial = testimonial_fixture()
      update_attrs = %{description: "some updated description", designation: "some updated designation", image: "some updated image", name: "some updated name"}

      assert {:ok, %Testimonial{} = testimonial} = Testimonials.update_testimonial(testimonial, update_attrs)
      assert testimonial.description == "some updated description"
      assert testimonial.designation == "some updated designation"
      assert testimonial.image == "some updated image"
      assert testimonial.name == "some updated name"
    end

    test "update_testimonial/2 with invalid data returns error changeset" do
      testimonial = testimonial_fixture()
      assert {:error, %Ecto.Changeset{}} = Testimonials.update_testimonial(testimonial, @invalid_attrs)
      assert testimonial == Testimonials.get_testimonial!(testimonial.id)
    end

    test "delete_testimonial/1 deletes the testimonial" do
      testimonial = testimonial_fixture()
      assert {:ok, %Testimonial{}} = Testimonials.delete_testimonial(testimonial)
      assert_raise Ecto.NoResultsError, fn -> Testimonials.get_testimonial!(testimonial.id) end
    end

    test "change_testimonial/1 returns a testimonial changeset" do
      testimonial = testimonial_fixture()
      assert %Ecto.Changeset{} = Testimonials.change_testimonial(testimonial)
    end
  end
end
