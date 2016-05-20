defmodule UserRepoSpec do
  use ESpec, async: false
  alias MyTurn.User
  alias MyTurn.Repo

  Ecto.Adapters.SQL.begin_test_transaction(Repo)

  it "enforces uniqueness of email" do
    same_email = "foo@example.com"
    first_changeset = User.changeset(%User{},
    %{ email: same_email, name: "Joe"})
    Repo.insert!(first_changeset)
    second_changeset = User.changeset(%User{}, %{email: same_email,
                                                 name: "Bob"})
    expect elem(Repo.insert(second_changeset), 0) |> to(eq :error)
  end
end
