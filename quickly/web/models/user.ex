defmodule Quickly.User do
  use Quickly.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :name, :string
    field :last_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :crypted_password, :name, :last_name])
    |> validate_required([:email, :crypted_password, :name, :last_name])
    |> unique_constraint(:email)
  end
end
