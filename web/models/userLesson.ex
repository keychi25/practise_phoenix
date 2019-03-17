defmodule PractisePhoenix.UserLesson do
  use PractisePhoenix.Web, :model

  schema "user_lessons" do
    field :user_id, :integer ## ユーザの外部ID
    field :lesson_id, :integer ## 授業の外部ID

    timestamps()
  end

  @required_fields ~w(user_id lesson_id)
  @optional_fields ~w()
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def get_lesson(user_lesson, lesson, id, day_of_the_week, time) do
    if user_lesson.lesson_id == lesson.id && user_lesson.user_id == id && lesson.day_of_the_week == day_of_the_week && lesson.time == time do
      true
    end
  end
end
