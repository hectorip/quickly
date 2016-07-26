defmodule Quickly.QuoteTest do
  use Quickly.ModelCase

  alias Quickly.Quote

  @valid_attrs %{book: 42, collection: 42, content: "some content", rating: "120.5", user: 42, voters: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Quote.changeset(%Quote{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Quote.changeset(%Quote{}, @invalid_attrs)
    refute changeset.valid?
  end
end
