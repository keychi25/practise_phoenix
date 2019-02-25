defmodule PractisePhoenix.Repo.Migrations.CreateLessons do
  use Ecto.Migration

  def change do
    create table(:lessons) do
      add :name, :string
      add :place, :string
      add :professor, :string
      add :year, :integer
      add :semester, :string
      add :day_of_the_week, :string
      add :time, :integer

      timestamps()
    end
  end
end
