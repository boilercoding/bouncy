defmodule Bouncy.User do
  use Bouncy.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :password])
    |> validate_required([:name, :username, :password])
    |> validate_length(:username, min: 1, max: 20)
    |> validate_format(:username, ~r/^[a-zA-Z0-9_.-]*$/, message: "Please use letters and numbers(only characters allowed _ . -)")
  end
end
