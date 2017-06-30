defmodule Bouncy.UserTest do
  use Bouncy.ModelCase

  alias Bouncy.User

  @valid_attrs %{name: "some content", password: "somecontent123", username: "somecontent"}
  @invalid_attrs %{name: "some content", password: "somecontent", username: "somecontent"}

  test "changeset with valid attributes" do
    changeset = User.reg_changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.reg_changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
