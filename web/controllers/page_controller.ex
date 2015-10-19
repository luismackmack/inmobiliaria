defmodule Inmobiliaria.PageController do
  use Inmobiliaria.Web, :controller

  alias Inmobiliaria.Inmueble
  alias Inmobiliaria.TipoInmueble
  alias Inmobiliaria.TipoNegociacion
  alias Inmobiliaria.Pais
  alias Inmobiliaria.Estado
  alias Inmobiliaria.Ciudad
  alias Inmobiliaria.Usuario

  def index(conn, _params) do
  	changeset = Inmueble.changeset(%Inmueble{})
    tipo_inmueble = Repo.all(TipoInmueble)
    tipo_negociacion = Repo.all(TipoNegociacion)
    pais = Repo.all(Pais)
    render(conn, "index.html", changeset: changeset, tipo_inmueble: tipo_inmueble, tipo_negociacion: tipo_negociacion, pais: pais)
  end

  def quienes_somos(conn, _params) do
    render(conn, "quienes_somos.html")
  end

  def se_un_agente(conn, _params) do
    render(conn, "se_un_agente.html")
  end

end
