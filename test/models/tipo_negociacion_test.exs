defmodule Inmobiliaria.TipoNegociacionTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.TipoNegociacion

  @valid_attrs %{nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TipoNegociacion.changeset(%TipoNegociacion{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TipoNegociacion.changeset(%TipoNegociacion{}, @invalid_attrs)
    refute changeset.valid?
  end
end
