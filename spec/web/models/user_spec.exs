defmodule UserSpec do
  use ESpec, async: true
  alias MyTurn.User

  describe "changeset" do
    context "email not present" do
      it "is not valid" do
        changeset = User.changeset(%User{}, %{name: "Joe"})
        expect changeset.valid? |> to(be_false)
      end
    end

    context "name not present" do
      it "is not valid" do
        changeset = User.changeset(%User{}, %{email: "foo@example.org"})
        expect changeset.valid? |> to(be_false)
      end
    end

    context "name and email present" do
      it "is valid" do
        changeset = User.changeset(%User{},
         %{email: "foo@example.org", name: "Joe"})
        expect changeset.valid? |> to(be_true)
      end
    end
  end

  describe "registration_changeset" do
    context "password not passed" do
      it "is invalid" do
        changeset = User
        .registration_changeset(%User{},
         %{email: "bar@example.org", name: "John"})
       expect(changeset.valid?) |> to(be_false)
      end
    end

    context "password of valid length passed" do
      it "is valid" do
        changeset = User
        .registration_changeset(%User{},
         %{email: "bar@example.org", name: "John", password: "foobar"})
       expect(changeset.valid?) |> to(be_true)
      end
    end

    context "password too short" do
      it "is invalid" do
        changeset = User
        .registration_changeset(%User{},
         %{email: "bar@example.org", name: "John", password: "fooba"})
       expect(changeset.valid?) |> to(be_false)
      end
    end

    context "Password too long" do
      it "is invalid" do
        long_password = String.duplicate("a", 101)
        changeset = User
        .registration_changeset(%User{},
        %{email: "bar@example.org", name: "John", password: long_password})
        expect(changeset.valid?) |> to(be_false)
      end
    end
  end
end
