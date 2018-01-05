defmodule GraphqlMiniBlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :description, :string
      add :title, :string, null: false
      add :about, :string
      add :author_id, references(:authors, on_delete: :nilify_all)

      timestamps()
    end

    create index(:posts, [:author_id])
  end
end
