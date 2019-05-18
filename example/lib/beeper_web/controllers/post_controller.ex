defmodule BeeperWeb.PostController do
  use BeeperWeb, :controller

  alias Beeper.Posting
  alias Beeper.Posting.Post

  def index(conn, _params) do
    changeset = Posting.change_post(%Post{})
    posts = Posting.list_posts()
    render(conn, "index.html", posts: posts, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Posting.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Posting.create_post(Map.merge(post_params, %{ "author_id" => conn.assigns.current_user.id })) do
      {:ok, post} ->
        conn
        |> broadcast_post(post)
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp broadcast_post(%{ assigns: %{ current_user: %{ name: name, id: author_id }}} = conn, %{ body: body, id: id, inserted_at: inserted_at}) do
    BeeperWeb.Endpoint.broadcast("posts", "new_post", %{ id: id, author_name: name, author_id: author_id, body: body, inserted_at: inserted_at })
    conn
  end
end
