defmodule BeeperWeb.PostView do
  use BeeperWeb, :view

  def post_classes(conn, post) do
    if Coherence.current_user(conn) == post.author do
      "post__author post__author--highlight"
    else
      "post__author"
    end
  end
end
