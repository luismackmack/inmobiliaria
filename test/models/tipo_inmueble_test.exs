defmodule Inmobiliaria.TipoInmuebleTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.TipoInmueble

  @valid_attrs %{nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TipoInmueble.changeset(%TipoInmueble{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TipoInmueble.changeset(%TipoInmueble{}, @invalid_attrs)
    refute changeset.valid?
  end
end
