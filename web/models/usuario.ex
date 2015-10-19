defmodule Inmobiliaria.Usuario do
  use Inmobiliaria.Web, :model

  schema "usuarios" do
    field :crypted_password, :string
    field :nombre, :string
    field :apellido, :string
    field :email, :string
    field :telefono, :string
    field :celular, :string
    has_many :inmuebles, Inmobiliaria.Inmueble
    has_many :solicitudes, Inmobiliaria.Solicitud
    belongs_to :imagen, Inmobiliaria.Imagen, foreign_key: :imagen_id

    timestamps
  end

  @required_fields ~w(crypted_password nombre apellido email telefono celular)
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
