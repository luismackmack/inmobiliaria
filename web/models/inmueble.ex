defmodule Inmobiliaria.Inmueble do
  use Inmobiliaria.Web, :model

  schema "inmuebles" do
    field :precio, :decimal
    field :superficie, :decimal
    field :habitaciones, :integer
    field :bathroom, :integer
    field :puestos_estacionamiento, :integer
    field :ubicacion, :string
    field :aire_acondicionado, :boolean, default: false
    field :descripcion, :string
    has_many :solicitudes, Inmobiliaria.Solicitud
    belongs_to :tipo_inmueble, Inmobiliaria.TipoInmueble, foreign_key: :tipo_inmueble_id
    belongs_to :tipo_negociacion, Inmobiliaria.TipoNegociacion, foreign_key: :tipo_negociacion_id
    belongs_to :pais, Inmobiliaria.Pais, foreign_key: :pais_id
    belongs_to :estado, Inmobiliaria.Estado, foreign_key: :estado_id
    belongs_to :ciudad, Inmobiliaria.Ciudad, foreign_key: :ciudad_id
    belongs_to :usuario, Inmobiliaria.Usuario, foreign_key: :usuario_id
    belongs_to :imagen, Inmobiliaria.Imagen, foreign_key: :imagen_id

    timestamps
  end

  @required_fields ~w(precio superficie habitaciones bathroom puestos_estacionamiento ubicacion aire_acondicionado descripcion tipo_inmueble_id tipo_negociacion_id pais_id estado_id ciudad_id usuario_id)
  @optional_fields ~w(imagen_id)

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
