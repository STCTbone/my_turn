ExUnit.start

Mix.Task.run "ecto.create", ~w(-r MyTurn.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r MyTurn.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(MyTurn.Repo)

