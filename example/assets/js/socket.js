
import { Socket } from "phoenix"

const tag = (name, attrs) => {
  var el = document.createElement(name.toString());

  !!attrs && Object.keys(attrs).forEach(function (key) {
    el.setAttribute(key, attrs[key]);
  });

  return el;
}

let socket = new Socket("/socket", { params: { token: document.querySelector("meta[name=user_token]").content } })

const userId = document.querySelector("meta[name=user_id]").content

socket.connect()

let channel = socket.channel("posts", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("new_post", ({ body, author_name, inserted_at, author_id }) => {
  const postDiv = tag('div', { class: 'post post--highlight' })
  const authorDiv = tag('div', { class: ['post__author', author_id === userId ? 'post__author--highlight' : ''].join(' ') })
  authorDiv.innerText = author_name
  const bodyDiv = tag('div', { class: 'post__body' })
  bodyDiv.innerText = body
  const timestampDiv = tag('div', { class: 'post__timestamp' })
  timestampDiv.innerText = inserted_at.replace('T', ' ')
  postDiv.appendChild(authorDiv)
  postDiv.appendChild(bodyDiv)
  postDiv.appendChild(timestampDiv)

  const postsDiv = document.getElementById('posts')
  postsDiv.insertBefore(postDiv, postsDiv.firstChild)
})

export default socket
