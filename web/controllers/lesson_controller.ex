defmodule PractisePhoenix.LessonController do
  use PractisePhoenix.Web, :controller
  alias PractisePhoenix.Lesson
  alias PractisePhoenix.UserLesson

  def index(conn, _params) do
    lessons = Repo.all(Lesson)
    render conn, "index.html", lessons: lessons
  end

  def new(conn, _params) do
    changeset = Lesson.changeset(%Lesson{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"lesson" => lesson_params}) do
    changeset = Lesson.changeset(%Lesson{}, lesson_params)
    case Repo.insert(changeset) do
      {:ok, lesson} ->
        conn
        |> put_flash(:info, "#{lesson.name}を作成しました")
        |> redirect(to: lesson_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lesson = Repo.get(Lesson, id)
    render conn, "show.html", lesson: lesson
  end

  def edit(conn, %{"id" => id}) do
    lesson = Repo.get(Lesson, id)
    changeset = Lesson.changeset(lesson)
    render(conn, "edit.html", lesson: lesson, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lesson" => lesson_params}) do
    lesson = Repo.get(Lesson, id)
    changeset = Lesson.changeset(lesson, lesson_params)

    case Repo.update(changeset) do
      {:ok, lesson} ->
        conn
        |> put_flash(:info, "更新しました")
        |> redirect(to: lesson_path(conn, :show, lesson.id))
      {:error, changeset} ->
        render(conn, "edit.html", lesson: lesson, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lesson = Repo.get(Lesson, id)
    Repo.delete(lesson)
    user_lesson = Repo.get_by(UserLesson, lesson_id: id)
    Repo.delete(user_lesson)

    conn
    |> put_flash(:info, "削除しました")
    |> redirect(to: lesson_path(conn, :index))
  end
end