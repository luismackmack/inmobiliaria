defmodule Inmobiliaria.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :crypted_password, :string
      add :nombre, :string
      add :apellido, :string
      add :email, :string
      add :telefono, :string
      add :celular, :string
      add :imagen_id, references(:imagenes)

      timestamps
    end
    create index(:usuarios, [:imagen_id])

  end
end
