defmodule PractisePhoenix.UserLessonController do
  use PractisePhoenix.Web, :controller
  alias PractisePhoenix.UserLesson
  alias PractisePhoenix.Lesson
  alias PractisePhoenix.User

  plug :authenticate_user when action in [:index, :delete]

  def index(conn, _params) do
    user_lessons = Repo.all(UserLesson)
    lessons = Repo.all(Lesson)
    users = Repo.all(User)
    changeset = UserLesson.changeset(%UserLesson{})
    render conn, "index.html", user_lessons: user_lessons, lessons: lessons, users: users, changeset: changeset
  end

  def new(conn, _params) do
    lessons = Repo.all(Lesson)
    changeset = UserLesson.changeset(%UserLesson{})
    render conn, "new.html", lessons: lessons, changeset: changeset
  end

  def create(conn, %{"user_lesson" => user_lesson_params}) do
    changeset = UserLesson.changeset(%UserLesson{}, user_lesson_params)
    case Repo.insert(changeset) do
      {:ok, user_lesson} ->
        conn
        |> put_flash(:info, "登録しました")
        |> redirect(to: user_lesson_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_lesson = Repo.get(UserLesson, id)
    render conn, "show.html", user_lesson: user_lesson
  end

  def delete(conn, %{"id" => id}) do
    user_lesson = Repo.get(UserLesson, id)
    Repo.delete(user_lesson)

    conn
    |> put_flash(:info, "削除しました")
    |> redirect(to: user_lesson_path(conn, :index))
  end

  def timetable(conn, %{"id" => id}) do
    user_lessons = Repo.all(UserLesson)
    lessons = Repo.all(Lesson)
    render conn, "timetable.html", user_lessons: user_lessons, lessons: lessons, id: id
  end

  def share(conn, _params) do
    user_lessons = Repo.all(UserLesson)
    lessons = Repo.all(Lesson)
    render conn, "share.html", user_lessons: user_lessons, lessons: lessons
  end

end
