defmodule Appli.SignatureTest do
  use Appli.ModelCase

  alias Appli.Signature

  @valid_attrs %{adress: "some content", email: "some content", firstname: "some content", lastname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Signature.changeset(%Signature{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Signature.changeset(%Signature{}, @invalid_attrs)
    refute changeset.valid?
  end
end
