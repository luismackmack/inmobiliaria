defmodule Inmobiliaria.Repo.Migrations.ModifyInmuebles do
  use Ecto.Migration

  def change do
  	alter table(:inmuebles) do
  		modify :precio, :decimal
  		modify :superficie, :decimal
	end
  end
end
