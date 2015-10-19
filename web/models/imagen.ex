defmodule Inmobiliaria.Imagen do
  use Inmobiliaria.Web, :model

  schema "imagenes" do
    field :url, :string
    field :fecha, Ecto.DateTime
    has_one :usuario, Inmobiliaria.Usuario
    has_one :inmuebles, Inmobiliaria.Inmueble
    timestamps
  end

  @required_fields ~w(url fecha)
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
