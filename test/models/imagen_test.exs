defmodule Inmobiliaria.ImagenTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.Imagen

  @valid_attrs %{fecha: "2010-04-17 14:00:00", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Imagen.changeset(%Imagen{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Imagen.changeset(%Imagen{}, @invalid_attrs)
    refute changeset.valid?
  end
end
