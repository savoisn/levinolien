defmodule Appli.PapersController do
  use Appli.Web, :controller

  def getPapers() do
    [
      %{:url => "images/papers/signatures_papier_1.jpg", :nb => 18},
      %{:url => "images/papers/signatures_papier_2.jpg", :nb => 15},
      %{:url => "images/papers/signatures_papier_3.jpg", :nb => 20},
      %{:url => "images/papers/signatures_papier_4.jpg", :nb => 16},
      %{:url => "images/papers/signatures_papier_5.jpg", :nb => 13},
      %{:url => "images/papers/signatures_papier_6.jpg", :nb => 22},
      %{:url => "images/papers/signatures_papier_7.jpg", :nb => 18},
      %{:url => "images/papers/signatures_papier_8.jpg", :nb => 13},
      %{:url => "images/papers/signatures_papier_9.jpg", :nb => 22},
      %{:url => "images/papers/signatures_papier_10.jpg", :nb => 18},
    ]
  end 

  def index(conn, _params) do
    papers = getPapers()
    render conn, "index.html", papers: papers
  end
end
