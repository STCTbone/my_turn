defmodule MyTurn.Repo.Migrations.CreateMeeting do
  use Ecto.Migration

  def change do
    create table(:meetings) do
      add :title, :string
      add :question_ids, {:array, :integer}

      timestamps
    end

  end
end
