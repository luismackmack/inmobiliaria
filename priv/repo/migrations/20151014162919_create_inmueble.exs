defmodule Inmobiliaria.Repo.Migrations.CreateInmueble do
  use Ecto.Migration

  def change do
    create table(:inmuebles) do
      add :precio, :float
      add :superficie, :float
      add :habitaciones, :integer
      add :bathroom, :integer
      add :puestos_estacionamiento, :integer
      add :ubicacion, :text
      add :aire_acondicionado, :boolean, default: false
      add :descripcion, :text
      add :tipo_inmueble_id, references(:tipo_inmuebles)
      add :tipo_negociacion_id, references(:tipo_negociaciones)
      add :pais_id, references(:paises)
      add :estado_id, references(:estados)
      add :ciudad_id, references(:ciudades)
      add :usuario_id, references(:usuarios)
      add :imagen_id, references(:imagenes)

      timestamps
    end
    create index(:inmuebles, [:tipo_inmueble_id])
    create index(:inmuebles, [:tipo_negociacion_id])
    create index(:inmuebles, [:pais_id])
    create index(:inmuebles, [:estado_id])
    create index(:inmuebles, [:ciudad_id])
    create index(:inmuebles, [:usuario_id])
    create index(:inmuebles, [:imagen_id])

  end
end
