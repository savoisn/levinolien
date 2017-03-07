defmodule Appli.PageController do
  use Appli.Web, :controller

  alias Appli.Signature
  alias Appli.PapersController

  def index(conn, _params) do
    signatures = Repo.all(Signature)
    changeset = Signature.changeset(%Signature{})
    papers = PapersController.getPapers()
    nbPapers = Enum.reduce(papers , 0, fn(paper, acc) -> paper.nb + acc end )
    render(conn, "index.html", signatures: signatures, changeset: changeset, nbPapers: nbPapers)
  end

  def create(conn, %{"signature" => signature_params}) do
    changeset = Signature.changeset(%Signature{}, signature_params)

    case Repo.insert(changeset) do
      {:ok, _signature} ->
        conn
        |> put_flash(:info, "Signature created successfully.")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Signature creation failed, please try again later.")
    end
  end
end
