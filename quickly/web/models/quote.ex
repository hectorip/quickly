defmodule Quickly.Quote do
  use Quickly.Web, :model

  schema "quotes" do
    field :content, :string
    field :book, :integer
    field :user, :integer
    field :rating, :float
    field :voters, :integer
    field :collection, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content, :book, :user, :rating, :voters, :collection])
    |> validate_required([:content, :book, :user, :rating, :voters, :collection])
  end
end
