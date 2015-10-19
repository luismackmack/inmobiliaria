defmodule Inmobiliaria.Repo.Migrations.CreateTipoNegociacion do
  use Ecto.Migration

  def change do
    create table(:tipo_negociaciones) do
      add :nombre, :string

      timestamps
    end

  end
end
