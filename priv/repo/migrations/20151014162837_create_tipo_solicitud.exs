defmodule Inmobiliaria.Repo.Migrations.CreateTipoSolicitud do
  use Ecto.Migration

  def change do
    create table(:tipo_solicitudes) do
      add :nombre, :string

      timestamps
    end

  end
end
