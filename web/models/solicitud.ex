defmodule Inmobiliaria.Solicitud do
  use Inmobiliaria.Web, :model

  schema "solicitudes" do
    field :status, :boolean, default: false
    field :fecha_inicio, Ecto.DateTime
    field :fecha_cierre, Ecto.DateTime
    field :comentario, :string
    belongs_to :tipo_solicitud, Inmobiliaria.TipoSolicitud, foreign_key: :tipo_solicitud_id
    belongs_to :inmueble, Inmobiliaria.Inmueble, foreign_key: :inmueble_id
    belongs_to :usuario, Inmobiliaria.Usuario, foreign_key: :usuario_id

    timestamps
  end

  @required_fields ~w(status fecha_inicio fecha_cierre comentario tipo_solicitud_id inmueble_id usuario_id)
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
