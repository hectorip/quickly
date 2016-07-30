defmodule Quickly.User do
  use Quickly.Web, :model

  @required_fields ~w(email password)a
  @optional_fields ~w(name last_name)a
  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :name, :string
    field :last_name, :string
    field :password, :string, virtual: true


    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end
end
