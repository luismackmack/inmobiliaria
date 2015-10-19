defmodule Inmobiliaria.Repo.Migrations.CreateTipoInmueble do
  use Ecto.Migration

  def change do
    create table(:tipo_inmuebles) do
      add :nombre, :string

      timestamps
    end

  end
end
