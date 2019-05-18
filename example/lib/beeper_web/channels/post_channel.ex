defmodule BeeperWeb.PostChannel do
  use Phoenix.Channel

  def join("posts", _message, socket) do
    {:ok, socket}
  end
end
