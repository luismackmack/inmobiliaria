defmodule Inmobiliaria.EstadoTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.Estado

  @valid_attrs %{nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Estado.changeset(%Estado{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Estado.changeset(%Estado{}, @invalid_attrs)
    refute changeset.valid?
  end
end
