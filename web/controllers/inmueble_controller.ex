defmodule Inmobiliaria.InmuebleController do
  use Inmobiliaria.Web, :controller

  import Ecto.Query
  alias Inmobiliaria.Inmueble
  alias Inmobiliaria.TipoInmueble
  alias Inmobiliaria.TipoNegociacion
  alias Inmobiliaria.Pais
  alias Inmobiliaria.Estado
  alias Inmobiliaria.Ciudad
  alias Inmobiliaria.Usuario

  plug :scrub_params, "inmueble" when action in [:create, :update]

  def index(conn, _params) do
    inmuebles = Repo.all(Inmueble)
    render(conn, "index.html", inmuebles: inmuebles)
  end

  def new(conn, _params) do
    changeset = Inmueble.changeset(%Inmueble{})
    tipo_inmueble = Repo.all(TipoInmueble)
    tipo_negociacion = Repo.all(TipoNegociacion)
    pais = Repo.all(Pais)
    usuario = Repo.all(Usuario)
    render(conn, "new.html", changeset: changeset, tipo_inmueble: tipo_inmueble, tipo_negociacion: tipo_negociacion, pais: pais, usuario: usuario)
  end

  def create(conn, %{"inmueble" => inmueble_params}) do
    usuario = conn.params["usuario"]
    tipo_inmueble = conn.params["tipo_inmueble"]
    tipo_negociacion = conn.params["tipo_negociacion"]
    pais = conn.params["pais"]
    estado = conn.params["estado"]
    ciudad = conn.params["ciudad"]
    external_params = %{"usuario_id" => usuario, "tipo_inmueble_id" => tipo_inmueble, "tipo_negociacion_id" => tipo_negociacion, "pais_id" => pais, "estado_id" => estado, "ciudad_id" => ciudad}
    changeset = Inmueble.changeset(%Inmueble{}, Map.merge(inmueble_params, external_params))

    case Repo.insert(changeset) do
      {:ok, _inmueble} ->
        conn
        |> put_flash(:info, "Inmueble created successfully.")
        |> redirect(to: inmueble_path(conn, :index))
      {:error, changeset} ->
        tipo_inmueble = Repo.all(TipoInmueble)
        tipo_negociacion = Repo.all(TipoNegociacion)
        pais = Repo.all(Pais)
        usuario = Repo.all(Usuario)
        render(conn, "new.html", changeset: changeset, tipo_inmueble: tipo_inmueble, tipo_negociacion: tipo_negociacion, pais: pais, usuario: usuario)
    end
  end

  def show(conn, %{"id" => id}) do
    inmueble = Repo.get!(Inmueble, id)
    render(conn, "show.html", inmueble: inmueble)
  end

  def edit(conn, %{"id" => id}) do
    tipo_inmueble = Repo.all(TipoInmueble)
    tipo_negociacion = Repo.all(TipoNegociacion)
    pais = Repo.all(Pais)
    usuario = Repo.all(Usuario)
    inmueble = Repo.get!(Inmueble, id)
    changeset = Inmueble.changeset(inmueble)
    render(conn, "edit.html", changeset: changeset, inmueble: inmueble, tipo_inmueble: tipo_inmueble, tipo_negociacion: tipo_negociacion, pais: pais, usuario: usuario)
  end

  def update(conn, %{"id" => id, "inmueble" => inmueble_params}) do
    IO.inspect inmueble_params
    inmueble = Repo.get!(Inmueble, id)
    changeset = Inmueble.changeset(inmueble, inmueble_params)

    case Repo.update(changeset) do
      {:ok, inmueble} ->
        conn
        |> put_flash(:info, "Inmueble updated successfully.")
        |> redirect(to: inmueble_path(conn, :show, inmueble))
      {:error, changeset} ->
        render(conn, "edit.html", inmueble: inmueble, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inmueble = Repo.get!(Inmueble, id)
    Repo.delete!(inmueble)
    conn
    |> put_flash(:info, "Inmueble deleted successfully.")
    |> redirect(to: inmueble_path(conn, :index))
  end

  def query_inmuebles(conn, %{"inmueble" => inmueble_params}) do


    tipo_inmueble = Repo.all(TipoInmueble)
    tipo_negociacion = Repo.all(TipoNegociacion)
    pais = Repo.all(Pais)
    usuario = Repo.all(Usuario)
    changeset = Inmueble.changeset(%Inmueble{})
    

    query = from i in Inmueble
    if conn.params["tipo_inmueble"] != "0", do: query = from i in query, where: i.tipo_inmueble_id == ^String.to_integer(conn.params["tipo_inmueble"])
    if conn.params["tipo_negociacion"] != "0", do: query = from i in query, where: i.tipo_negociacion_id == ^String.to_integer(conn.params["tipo_negociacion"])
    if inmueble_params["precio_b"] != "0", do: query = from i in query, where: i.precio >= ^inmueble_params["precio_a"] and i.precio <= ^inmueble_params["precio_b"]
    if inmueble_params["superficie_b"] != "0", do: query = from i in query, where: i.superficie >= ^inmueble_params["superficie_a"] and i.superficie <= ^inmueble_params["superficie_b"]
    if conn.params["pais"] != "0", do: query = from i in query, where: i.pais_id == ^conn.params["pais"]
    if conn.params["estado"] != "0", do: query = from i in query, where: i.estado_id == ^conn.params["estado"]
    if conn.params["ciudad"] != "0", do: query = from i in query, where: i.ciudad_id == ^conn.params["ciudad"]
    if inmueble_params["habitaciones"] != "0", do: query = from i in query, where: i.habitaciones == ^inmueble_params["habitaciones"]
    if inmueble_params["puestos_estacionamiento"] != "0", do: query = from i in query, where: i.puestos_estacionamiento == ^inmueble_params["puestos_estacionamiento"]
    if inmueble_params["aire_acondicionado"] != "false", do: query = from i in query, where: i.aire_acondicionado == true
    query = from i in query, join: p in assoc(i, :pais), join: ti in assoc(i, :tipo_inmueble), join: tn in assoc(i, :tipo_negociacion), join: e in assoc(i, :estado), join: c in assoc(i, :ciudad),select: %{precio: i.precio, superficie: i.superficie, habitaciones: i.habitaciones, bathroom: i.bathroom, puestos_estacionamiento: i.puestos_estacionamiento, tipo_inmueble: ti.nombre, tipo_negociacion: tn.nombre, estado: e.nombre, ciudad: c.nombre}
    inmuebles = Repo.all(query)
    render(conn, "query_inmuebles.html", changeset: changeset, inmuebles: inmuebles, tipo_inmueble: tipo_inmueble, tipo_negociacion: tipo_negociacion, pais: pais)
  end

  def query_estado(conn, %{"pais" => pais}) do
    result = Repo.all(from e in Estado, join: p in Pais, on: e.pais_id == p.id, where: e.pais_id == ^pais, order_by: e.id, select: %{id: e.id, nombre: e.nombre}) 
    conn
    |>json %{result: result}
  end

  def query_ciudad(conn, %{"estado" => estado}) do
    result = Repo.all(from c in Ciudad, join: e in Estado, on: c.estado_id == e.id, where: c.estado_id == ^estado, order_by: c.id, select: %{id: c.id, nombre: c.nombre})
    conn
    |>json %{result: result}
  end

end
