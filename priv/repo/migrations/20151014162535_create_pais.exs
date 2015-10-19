defmodule Inmobiliaria.Repo.Migrations.CreatePais do
  use Ecto.Migration

  def change do
    create table(:paises) do
      add :nombre, :string

      timestamps
    end

  end
end
