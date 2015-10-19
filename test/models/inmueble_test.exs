defmodule Inmobiliaria.InmuebleTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.Inmueble

  @valid_attrs %{aire_acondicionado: true, bathroom: 42, descripcion: "some content", habitaciones: 42, precio: "120.5", puestos_estacionamiento: 42, superficie: "120.5", ubicacion: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Inmueble.changeset(%Inmueble{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Inmueble.changeset(%Inmueble{}, @invalid_attrs)
    refute changeset.valid?
  end
end
