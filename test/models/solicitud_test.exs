defmodule Inmobiliaria.SolicitudTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.Solicitud

  @valid_attrs %{comentario: "some content", fecha_cierre: "2010-04-17 14:00:00", fecha_inicio: "2010-04-17 14:00:00", status: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Solicitud.changeset(%Solicitud{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Solicitud.changeset(%Solicitud{}, @invalid_attrs)
    refute changeset.valid?
  end
end
