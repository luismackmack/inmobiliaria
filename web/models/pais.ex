defmodule Inmobiliaria.Pais do
  use Inmobiliaria.Web, :model

  schema "paises" do
    field :nombre, :string
    has_many :estados, Inmobiliaria.Estado
    has_many :inmuebles, Inmobiliaria.Inmueble
    timestamps
  end

  @required_fields ~w(nombre)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
