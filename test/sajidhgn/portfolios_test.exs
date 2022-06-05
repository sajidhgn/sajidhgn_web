defmodule Sajidhgn.PortfoliosTest do
  use Sajidhgn.DataCase

  alias Sajidhgn.Portfolios

  describe "portfolios" do
    alias Sajidhgn.Portfolios.Portfolio

    import Sajidhgn.PortfoliosFixtures

    @invalid_attrs %{category: nil, image: nil}

    test "list_portfolios/0 returns all portfolios" do
      portfolio = portfolio_fixture()
      assert Portfolios.list_portfolios() == [portfolio]
    end

    test "get_portfolio!/1 returns the portfolio with given id" do
      portfolio = portfolio_fixture()
      assert Portfolios.get_portfolio!(portfolio.id) == portfolio
    end

    test "create_portfolio/1 with valid data creates a portfolio" do
      valid_attrs = %{category: "some category", image: "some image"}

      assert {:ok, %Portfolio{} = portfolio} = Portfolios.create_portfolio(valid_attrs)
      assert portfolio.category == "some category"
      assert portfolio.image == "some image"
    end

    test "create_portfolio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Portfolios.create_portfolio(@invalid_attrs)
    end

    test "update_portfolio/2 with valid data updates the portfolio" do
      portfolio = portfolio_fixture()
      update_attrs = %{category: "some updated category", image: "some updated image"}

      assert {:ok, %Portfolio{} = portfolio} = Portfolios.update_portfolio(portfolio, update_attrs)
      assert portfolio.category == "some updated category"
      assert portfolio.image == "some updated image"
    end

    test "update_portfolio/2 with invalid data returns error changeset" do
      portfolio = portfolio_fixture()
      assert {:error, %Ecto.Changeset{}} = Portfolios.update_portfolio(portfolio, @invalid_attrs)
      assert portfolio == Portfolios.get_portfolio!(portfolio.id)
    end

    test "delete_portfolio/1 deletes the portfolio" do
      portfolio = portfolio_fixture()
      assert {:ok, %Portfolio{}} = Portfolios.delete_portfolio(portfolio)
      assert_raise Ecto.NoResultsError, fn -> Portfolios.get_portfolio!(portfolio.id) end
    end

    test "change_portfolio/1 returns a portfolio changeset" do
      portfolio = portfolio_fixture()
      assert %Ecto.Changeset{} = Portfolios.change_portfolio(portfolio)
    end
  end
end
