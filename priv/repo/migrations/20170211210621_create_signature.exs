defmodule Appli.Repo.Migrations.CreateSignature do
  use Ecto.Migration

  def change do
    create table(:signatures) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :adress, :string

      timestamps()
    end

  end
end
