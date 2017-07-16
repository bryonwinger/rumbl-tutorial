defmodule Rumbl.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:catagories) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:catagories, [:name])
  end
end
