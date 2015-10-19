defmodule Inmobiliaria.UsuarioTest do
  use Inmobiliaria.ModelCase

  alias Inmobiliaria.Usuario

  @valid_attrs %{apellido: "some content", celular: "some content", crypted_password: "some content", email: "some content", nombre: "some content", telefono: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @invalid_attrs)
    refute changeset.valid?
  end
end
