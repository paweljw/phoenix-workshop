defmodule BeeperWeb.PageController do
  use BeeperWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
