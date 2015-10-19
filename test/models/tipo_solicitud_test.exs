defmodule Inmobiliaria.TipoSolicitudTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.TipoSolicitud

  @valid_attrs %{nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TipoSolicitud.changeset(%TipoSolicitud{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TipoSolicitud.changeset(%TipoSolicitud{}, @invalid_attrs)
    refute changeset.valid?
  end
end
