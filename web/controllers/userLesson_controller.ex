defmodule PractisePhoenix.UserLessonController do
  use PractisePhoenix.Web, :controller
  alias PractisePhoenix.UserLesson
  plug :authenticate_user when action in [:index, :show, :edit, :update, :delete]
end