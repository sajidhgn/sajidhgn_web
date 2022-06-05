defmodule SajidhgnWeb.TestimonialView do
  use SajidhgnWeb, :view
  alias SajidhgnWeb.TestimonialView

  def render("index.json", %{testimonials: testimonials}) do
    %{data: render_many(testimonials, TestimonialView, "testimonial.json")}
  end

  def render("show.json", %{testimonial: testimonial}) do
    %{data: render_one(testimonial, TestimonialView, "testimonial.json")}
  end

  def render("testimonial.json", %{testimonial: testimonial}) do
    %{
      id: testimonial.id,
      image: testimonial.image,
      name: testimonial.name,
      designation: testimonial.designation,
      description: testimonial.description
    }
  end
end
