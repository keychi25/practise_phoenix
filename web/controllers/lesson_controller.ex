defmodule PractisePhoenix.LessonController do
  use PractisePhoenix.Web, :controller
  alias PractisePhoenix.User
  plug :authenticate_user when action in [:index, :show, :edit, :update, :delete]
end