defmodule SajidhgnWeb.PageController do
  use SajidhgnWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
