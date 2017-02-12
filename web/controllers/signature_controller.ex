defmodule Appli.SignatureController do
  use Appli.Web, :controller

  alias Appli.Signature

  def index(conn, _params) do
    signatures = Repo.all(Signature)
    render(conn, "index.html", signatures: signatures)
  end

  def new(conn, _params) do
    changeset = Signature.changeset(%Signature{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"signature" => signature_params}) do
    changeset = Signature.changeset(%Signature{}, signature_params)

    case Repo.insert(changeset) do
      {:ok, _signature} ->
        conn
        |> put_flash(:info, "Merci d'avoir signé la pétition.")
        |> redirect(to: signature_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    signature = Repo.get!(Signature, id)
    render(conn, "show.html", signature: signature)
  end

  def edit(conn, %{"id" => id}) do
    signature = Repo.get!(Signature, id)
    changeset = Signature.changeset(signature)
    render(conn, "edit.html", signature: signature, changeset: changeset)
  end

  def update(conn, %{"id" => id, "signature" => signature_params}) do
    signature = Repo.get!(Signature, id)
    changeset = Signature.changeset(signature, signature_params)

    case Repo.update(changeset) do
      {:ok, signature} ->
        conn
        |> put_flash(:info, "Signature updated successfully.")
        |> redirect(to: signature_path(conn, :show, signature))
      {:error, changeset} ->
        render(conn, "edit.html", signature: signature, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    signature = Repo.get!(Signature, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(signature)

    conn
    |> put_flash(:info, "Signature deleted successfully.")
    |> redirect(to: signature_path(conn, :index))
  end
end
