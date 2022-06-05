defmodule Sajidhgn.PortfoliosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sajidhgn.Portfolios` context.
  """

  @doc """
  Generate a portfolio.
  """
  def portfolio_fixture(attrs \\ %{}) do
    {:ok, portfolio} =
      attrs
      |> Enum.into(%{
        category: "some category",
        image: "some image"
      })
      |> Sajidhgn.Portfolios.create_portfolio()

    portfolio
  end
end
