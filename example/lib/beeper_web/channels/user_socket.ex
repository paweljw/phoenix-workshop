defmodule BeeperWeb.UserSocket do
  use Phoenix.Socket

  def connect(%{"token" => token}, socket) do
    case Coherence.verify_user_token(socket, token, &assign/3) do
      {:error, _} -> :error
      {:ok, socket} -> {:ok, socket}
    end
  end
end
