defmodule Inmobiliaria.CiudadTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.Ciudad

  @valid_attrs %{nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ciudad.changeset(%Ciudad{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ciudad.changeset(%Ciudad{}, @invalid_attrs)
    refute changeset.valid?
  end
end
