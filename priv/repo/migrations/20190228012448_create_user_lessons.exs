defmodule PractisePhoenix.Repo.Migrations.CreateUserLessons do
  use Ecto.Migration

  def change do
    create table(:user_lessons) do
      add :user_id, :integer
      add :lesson_id, :integer
      timestamps()
    end
  end
end
