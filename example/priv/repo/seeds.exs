# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Beeper.Repo.insert!(%Beeper.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

%Beeper.Coherence.User{}
|> Beeper.Coherence.User.changeset(%{
  name: "Paweł Wal",
  email: "pawel.wal@codesthq.com",
  password: "test123",
  password_confirmation: "test123"
})
|> Beeper.Repo.insert!()
