defmodule Quickly.Repo.Migrations.CreateQuote do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :content, :string
      add :book, :integer
      add :user, :integer
      add :rating, :float
      add :voters, :integer
      add :collection, :integer

      timestamps()
    end

  end
end
