defmodule SajidhgnWeb.Intro_ServiceController do
  use SajidhgnWeb, :controller

  alias Sajidhgn.Intro_Services
  alias Sajidhgn.Intro_Services.Intro_Service

  action_fallback SajidhgnWeb.FallbackController

  def index(conn, _params) do
    intro_services = Intro_Services.list_pr_services()
    render(conn, "index.json", intro_services: intro_services)
  end

  def create(conn, %{"intro__service" => intro__service_params}) do
    with {:ok, %Intro_Service{} = intro__service} <- Intro_Services.create_intro__service(intro__service_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.intro__service_path(conn, :show, intro__service))
      |> render("show.json", intro__service: intro__service)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    intro__service = Intro_Services.get_intro__service!(id)
    render(conn, "show.json", intro__service: intro__service)
  end

  def update(conn, %{"id" => id, "intro__service" => intro__service_params}) do
    intro__service = Pr_Services.get_intro__service!(id)

    with {:ok, %intro_Service{} = intro__service} <- Intro_Services.update_intro__service(intro__service, intro__service_params) do
      render(conn, "show.json", intro__service: intro__service)
    end
  end

  def delete(conn, %{"id" => id}) do
    intro__service = Intro_Services.get_intro__service!(id)

    with {:ok, %Intro_Service{}} <- Intro_Services.delete_intro__service(intro__service) do
      send_resp(conn, :no_content, "")
    end
  end
end
