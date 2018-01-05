defmodule GraphqlMiniBlog.Repo.Migrations.AddAuthorConstraints do
  use Ecto.Migration

  def change do
    alter table("authors") do
      modify :email, :string, null: false
      modify :first_name, :string, null: false
      modify :last_name, :string, null: false
    end

    create unique_index(:authors, [:email])
  end
end