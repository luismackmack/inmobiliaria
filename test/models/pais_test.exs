defmodule Inmobiliaria.PaisTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.Pais

  @valid_attrs %{nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pais.changeset(%Pais{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pais.changeset(%Pais{}, @invalid_attrs)
    refute changeset.valid?
  end
end
