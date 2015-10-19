defmodule Inmobiliaria.Repo.Migrations.CreateSolicitud do
  use Ecto.Migration

  def change do
    create table(:solicitudes) do
      add :status, :boolean, default: false
      add :fecha_inicio, :datetime
      add :fecha_cierre, :datetime
      add :comentario, :text
      add :tipo_solicitud_id, references(:tipo_solicitudes)
      add :inmueble_id, references(:inmuebles)
      add :usuario_id, references(:usuarios)

      timestamps
    end
    create index(:solicitudes, [:tipo_solicitud_id])
    create index(:solicitudes, [:inmueble_id])
    create index(:solicitudes, [:usuario_id])

  end
end
