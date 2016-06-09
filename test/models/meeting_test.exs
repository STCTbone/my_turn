defmodule MyTurn.MeetingTest do
  use MyTurn.ModelCase

  alias MyTurn.Meeting

  @valid_attrs %{question_ids: [], title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Meeting.changeset(%Meeting{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Meeting.changeset(%Meeting{}, @invalid_attrs)
    refute changeset.valid?
  end
end
