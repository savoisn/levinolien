defmodule Appli.WellknowController do
  use Appli.Web, :controller

  def index(conn, _params) do
    text conn, "Hello World"
  end

  def show(conn, %{"id" => id}) do
    text conn, "Hello World #{id}"
  end
end
