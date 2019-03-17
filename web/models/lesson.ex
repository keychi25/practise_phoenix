defmodule PractisePhoenix.Lesson do
  use PractisePhoenix.Web, :model

  schema "lessons" do
    field :name, :string ## 授業名
    field :place, :string ## 場所
    field :professor, :string ## 教授名
    field :year, :integer ## 年
    field :semester, :string ## 開設学期(Spring or Autumn)
    field :day_of_the_week, :string ## 曜日
    field :time, :integer ## 時限

    timestamps()
  end

  @required_fields ~w(name place professor year semester day_of_the_week time)
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 1, max: 30)
  end
end
