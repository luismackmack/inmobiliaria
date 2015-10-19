defmodule Inmobiliaria.Router do
  use Inmobiliaria.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Inmobiliaria do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/quienes_somos", PageController, :quienes_somos
    get "/se_un_agente", PageController, :se_un_agente
    resources "/usuarios", UsuarioController
    resources "/inmuebles", InmuebleController
    post "/query_inmuebles", InmuebleController, :query_inmuebles
    get "/inmuebles/query_estado/:pais", InmuebleController, :query_estado
    get "/inmuebles/query_ciudad/:estado", InmuebleController, :query_ciudad

  end

  # Other scopes may use custom stacks.
  # scope "/api", Inmobiliaria do
  #   pipe_through :api
  # end
end
