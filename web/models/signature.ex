defmodule Appli.Signature do
  use Appli.Web, :model

  schema "signatures" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :adress, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :email, :adress])
    |> validate_required([:firstname, :lastname, :email])
  end
end
