defmodule Sajidhgn.Skills_Into do
  @moduledoc """
  The Skills_Into context.
  """

  import Ecto.Query, warn: false
  alias Sajidhgn.Repo

  alias Sajidhgn.Skills_Into.Skill_Intro

  @doc """
  Returns the list of skills_intro.

  ## Examples

      iex> list_skills_intro()
      [%Skill_Intro{}, ...]

  """
  def list_skills_intro do
    Repo.all(Skill_Intro)
  end

  @doc """
  Gets a single skill__intro.

  Raises `Ecto.NoResultsError` if the Skill  intro does not exist.

  ## Examples

      iex> get_skill__intro!(123)
      %Skill_Intro{}

      iex> get_skill__intro!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill__intro!(id), do: Repo.get!(Skill_Intro, id)

  @doc """
  Creates a skill__intro.

  ## Examples

      iex> create_skill__intro(%{field: value})
      {:ok, %Skill_Intro{}}

      iex> create_skill__intro(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill__intro(attrs \\ %{}) do
    %Skill_Intro{}
    |> Skill_Intro.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skill__intro.

  ## Examples

      iex> update_skill__intro(skill__intro, %{field: new_value})
      {:ok, %Skill_Intro{}}

      iex> update_skill__intro(skill__intro, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill__intro(%Skill_Intro{} = skill__intro, attrs) do
    skill__intro
    |> Skill_Intro.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill__intro.

  ## Examples

      iex> delete_skill__intro(skill__intro)
      {:ok, %Skill_Intro{}}

      iex> delete_skill__intro(skill__intro)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill__intro(%Skill_Intro{} = skill__intro) do
    Repo.delete(skill__intro)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill__intro changes.

  ## Examples

      iex> change_skill__intro(skill__intro)
      %Ecto.Changeset{data: %Skill_Intro{}}

  """
  def change_skill__intro(%Skill_Intro{} = skill__intro, attrs \\ %{}) do
    Skill_Intro.changeset(skill__intro, attrs)
  end
end
