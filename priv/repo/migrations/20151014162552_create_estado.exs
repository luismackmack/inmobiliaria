defmodule Inmobiliaria.Repo.Migrations.CreateEstado do
  use Ecto.Migration

  def change do
    create table(:estados) do
      add :nombre, :string
      add :pais_id, references(:paises)

      timestamps
    end
    create index(:estados, [:pais_id])

  end
end
