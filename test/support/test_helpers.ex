defmodule Rumbl.TestHelpers do
  alias Rumbl.Repo

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      name: "Joe User",
      username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
      password: "supersecret"
      }, attrs)

    %Rumbl.User{}
    |> Rumbl.User.registration_changeset(changes)
    |> Repo.insert!()
  end

  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:videos, attrs)
    |> Repo.insert!()
  end

  # def insert_category(attrs \\ %{}) do
  #   changes = Dict.merge(%{name: "myname"}, attrs)

  #   %Rumbl.Category{}
  #   |> Rumbl.Category.changeset(changes)
  #   |> Repo.insert!()
  # end

  # def assoc_category(video, attrs \\ %{}) do
  #   category_cs = Dict.merge(%{name: "myname"}, attrs)

  #   video
  #   |> Ecto.build_assoc(:videos, category_cs)
  #   Repo.insert!()
  # end
end