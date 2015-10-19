defmodule Inmobiliaria.Estado do
  use Inmobiliaria.Web, :model

  schema "estados" do
    field :nombre, :string
    belongs_to :pais, Inmobiliaria.Pais, foreign_key: :pais_id
    has_many :ciudades, Inmobiliaria.Ciudad
    has_many :inmuebles, Inmobiliaria.Inmueble
    timestamps
  end

  @required_fields ~w(nombre pais_id)
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
