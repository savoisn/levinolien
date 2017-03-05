defmodule Appli.PapersController do
  use Appli.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
