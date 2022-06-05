defmodule Sajidhgn.Introductions do
  @moduledoc """
  The Introductions context.
  """

  import Ecto.Query, warn: false
  alias Sajidhgn.Repo

  alias Sajidhgn.Introductions.Introduction

  @doc """
  Returns the list of introduction.

  ## Examples

      iex> list_introduction()
      [%Introduction{}, ...]

  """
  def list_introduction do
    Repo.all(Introduction)
  end

  @doc """
  Gets a single introduction.

  Raises `Ecto.NoResultsError` if the Introduction does not exist.

  ## Examples

      iex> get_introduction!(123)
      %Introduction{}

      iex> get_introduction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_introduction!(id), do: Repo.get!(Introduction, id)

  @doc """
  Creates a introduction.

  ## Examples

      iex> create_introduction(%{field: value})
      {:ok, %Introduction{}}

      iex> create_introduction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_introduction(attrs \\ %{}) do
    %Introduction{}
    |> Introduction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a introduction.

  ## Examples

      iex> update_introduction(introduction, %{field: new_value})
      {:ok, %Introduction{}}

      iex> update_introduction(introduction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_introduction(%Introduction{} = introduction, attrs) do
    introduction
    |> Introduction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a introduction.

  ## Examples

      iex> delete_introduction(introduction)
      {:ok, %Introduction{}}

      iex> delete_introduction(introduction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_introduction(%Introduction{} = introduction) do
    Repo.delete(introduction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking introduction changes.

  ## Examples

      iex> change_introduction(introduction)
      %Ecto.Changeset{data: %Introduction{}}

  """
  def change_introduction(%Introduction{} = introduction, attrs \\ %{}) do
    Introduction.changeset(introduction, attrs)
  end
end
