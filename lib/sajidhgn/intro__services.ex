defmodule Sajidhgn.Intro_Services do
  @moduledoc """
  The Pr_Services context.
  """

  import Ecto.Query, warn: false
  alias Sajidhgn.Repo

  alias Sajidhgn.Intro_Services.Intro_Service

  @doc """
  Returns the list of pr_services.

  ## Examples

      iex> list_pr_services()
      [%Pr_Service{}, ...]

  """
  def list_intro_services do
    Repo.all(Intro_Service)
  end

  @doc """
  Gets a single pr__service.

  Raises `Ecto.NoResultsError` if the Pr  service does not exist.

  ## Examples

      iex> get_pr__service!(123)
      %Pr_Service{}

      iex> get_pr__service!(456)
      ** (Ecto.NoResultsError)

  """
  def get_intro__service!(id), do: Repo.get!(Intro_Service, id)

  @doc """
  Creates a pr__service.

  ## Examples

      iex> create_pr__service(%{field: value})
      {:ok, %Pr_Service{}}

      iex> create_pr__service(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_intro__service(attrs \\ %{}) do
    %Intro_Service{}
    |> Intro_Service.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pr__service.

  ## Examples

      iex> update_pr__service(pr__service, %{field: new_value})
      {:ok, %Pr_Service{}}

      iex> update_pr__service(pr__service, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_intro__service(%Intro_Service{} = intro__service, attrs) do
    intro__service
    |> Intro_Service.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pr__service.

  ## Examples

      iex> delete_pr__service(pr__service)
      {:ok, %Pr_Service{}}

      iex> delete_pr__service(pr__service)
      {:error, %Ecto.Changeset{}}

  """
  def delete_intro__service(%Intro_Service{} = intro__service) do
    Repo.delete(intro__service)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pr__service changes.

  ## Examples

      iex> change_pr__service(pr__service)
      %Ecto.Changeset{data: %Pr_Service{}}

  """
  def change_intro__service(%Intro_Service{} = intro__service, attrs \\ %{}) do
    Intro_Service.changeset(intro__service, attrs)
  end
end
