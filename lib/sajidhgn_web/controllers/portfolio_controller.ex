defmodule SajidhgnWeb.PortfolioController do
  use SajidhgnWeb, :controller

  alias Sajidhgn.Portfolios
  alias Sajidhgn.Portfolios.Portfolio

  action_fallback SajidhgnWeb.FallbackController

  def index(conn, _params) do
    portfolios = Portfolios.list_portfolios()
    render(conn, "index.json", portfolios: portfolios)
  end

  def create(conn, %{"portfolio" => portfolio_params}) do
    with {:ok, %Portfolio{} = portfolio} <- Portfolios.create_portfolio(portfolio_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.portfolio_path(conn, :show, portfolio))
      |> render("show.json", portfolio: portfolio)
    end
  end

  def show(conn, %{"id" => id}) do
    portfolio = Portfolios.get_portfolio!(id)
    render(conn, "show.json", portfolio: portfolio)
  end

  def update(conn, %{"id" => id, "portfolio" => portfolio_params}) do
    portfolio = Portfolios.get_portfolio!(id)

    with {:ok, %Portfolio{} = portfolio} <- Portfolios.update_portfolio(portfolio, portfolio_params) do
      render(conn, "show.json", portfolio: portfolio)
    end
  end

  def delete(conn, %{"id" => id}) do
    portfolio = Portfolios.get_portfolio!(id)

    with {:ok, %Portfolio{}} <- Portfolios.delete_portfolio(portfolio) do
      send_resp(conn, :no_content, "")
    end
  end
end
