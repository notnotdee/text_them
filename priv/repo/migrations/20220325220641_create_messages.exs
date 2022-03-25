defmodule TextThem.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :recipient, :string
      add :message_content, :string

      timestamps()
    end
  end
end
