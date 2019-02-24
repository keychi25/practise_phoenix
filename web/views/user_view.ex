defmodule PractisePhoenix.UserView do
  use PractisePhoenix.Web, :view
  alias PractisePhoenix.{User, Gravatar}

  def get_gravatar_url(%User{email: email}) do
    Gravatar.get_gravatar_url(email)
  end
end