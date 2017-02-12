defmodule Appli.SignatureControllerTest do
  use Appli.ConnCase

  alias Appli.Signature
  @valid_attrs %{adress: "some content", email: "some content", firstname: "some content", lastname: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, signature_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing signatures"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, signature_path(conn, :new)
    assert html_response(conn, 200) =~ "New signature"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, signature_path(conn, :create), signature: @valid_attrs
    assert redirected_to(conn) == signature_path(conn, :index)
    assert Repo.get_by(Signature, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, signature_path(conn, :create), signature: @invalid_attrs
    assert html_response(conn, 200) =~ "New signature"
  end

  test "shows chosen resource", %{conn: conn} do
    signature = Repo.insert! %Signature{}
    conn = get conn, signature_path(conn, :show, signature)
    assert html_response(conn, 200) =~ "Show signature"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, signature_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    signature = Repo.insert! %Signature{}
    conn = get conn, signature_path(conn, :edit, signature)
    assert html_response(conn, 200) =~ "Edit signature"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    signature = Repo.insert! %Signature{}
    conn = put conn, signature_path(conn, :update, signature), signature: @valid_attrs
    assert redirected_to(conn) == signature_path(conn, :show, signature)
    assert Repo.get_by(Signature, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    signature = Repo.insert! %Signature{}
    conn = put conn, signature_path(conn, :update, signature), signature: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit signature"
  end

  test "deletes chosen resource", %{conn: conn} do
    signature = Repo.insert! %Signature{}
    conn = delete conn, signature_path(conn, :delete, signature)
    assert redirected_to(conn) == signature_path(conn, :index)
    refute Repo.get(Signature, signature.id)
  end
end
