defmodule Inmobiliaria.InmuebleControllerTest do
  use Inmobiliaria.ConnCase

  alias Inmobiliaria.Inmueble
  @valid_attrs %{aire_acondicionado: true, bathroom: 42, descripcion: "some content", habitaciones: 42, precio: "120.5", puestos_estacionamiento: 42, superficie: "120.5", ubicacion: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, inmueble_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing inmuebles"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, inmueble_path(conn, :new)
    assert html_response(conn, 200) =~ "New inmueble"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, inmueble_path(conn, :create), inmueble: @valid_attrs
    assert redirected_to(conn) == inmueble_path(conn, :index)
    assert Repo.get_by(Inmueble, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, inmueble_path(conn, :create), inmueble: @invalid_attrs
    assert html_response(conn, 200) =~ "New inmueble"
  end

  test "shows chosen resource", %{conn: conn} do
    inmueble = Repo.insert! %Inmueble{}
    conn = get conn, inmueble_path(conn, :show, inmueble)
    assert html_response(conn, 200) =~ "Show inmueble"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, inmueble_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    inmueble = Repo.insert! %Inmueble{}
    conn = get conn, inmueble_path(conn, :edit, inmueble)
    assert html_response(conn, 200) =~ "Edit inmueble"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    inmueble = Repo.insert! %Inmueble{}
    conn = put conn, inmueble_path(conn, :update, inmueble), inmueble: @valid_attrs
    assert redirected_to(conn) == inmueble_path(conn, :show, inmueble)
    assert Repo.get_by(Inmueble, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    inmueble = Repo.insert! %Inmueble{}
    conn = put conn, inmueble_path(conn, :update, inmueble), inmueble: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit inmueble"
  end

  test "deletes chosen resource", %{conn: conn} do
    inmueble = Repo.insert! %Inmueble{}
    conn = delete conn, inmueble_path(conn, :delete, inmueble)
    assert redirected_to(conn) == inmueble_path(conn, :index)
    refute Repo.get(Inmueble, inmueble.id)
  end
end
