defmodule BeeperWeb.Coherence.RegistrationView do
  use BeeperWeb.Coherence, :view

  def render("registration.json", %{user: user}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        email: user.email
      }
    }
  end

  def render("session.json", %{user: user}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        email: user.email
      }
    }
  end

  def render("error.json", %{changeset: changeset}) do
    changeset =
      cond do
        is_nil(changeset) || changeset == "" -> "Unknown error."
        is_bitstring(changeset) -> changeset
        true -> error_string_from_changeset(changeset)
      end
    %{error: changeset}
  end
end
