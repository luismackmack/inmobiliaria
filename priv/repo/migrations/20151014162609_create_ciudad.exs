defmodule Inmobiliaria.Repo.Migrations.CreateCiudad do
  use Ecto.Migration

  def change do
    create table(:ciudades) do
      add :nombre, :string
      add :estado_id, references(:estados)

      timestamps
    end
    create index(:ciudades, [:estado_id])

  end
end
