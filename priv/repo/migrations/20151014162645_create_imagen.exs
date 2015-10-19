defmodule Inmobiliaria.Repo.Migrations.CreateImagen do
  use Ecto.Migration

  def change do
    create table(:imagenes) do
      add :url, :string
      add :fecha, :datetime

      timestamps
    end

  end
end
