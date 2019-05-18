defmodule BeeperWeb.PostController do
  use BeeperWeb, :controller

  alias Beeper.Posting
  alias Beeper.Posting.Post

  def index(conn, _params) do
    posts = Posting.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Posting.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Posting.create_post(Map.merge(post_params, %{ "author_id" => conn.assigns.current_user.id })) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
