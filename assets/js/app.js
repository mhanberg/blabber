// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

const prependBlab = function({author, body, date}) {
  let authorElement = document.createElement("h5")
  authorElement.append(document.createTextNode(`@${author}`));
  authorElement.classList.add("text-grey-dark");

  let bodyElement = document.createElement("h3")
  bodyElement.append(document.createTextNode(body));
  bodyElement.classList.add("text-black");

  let dateElement = document.createElement("p")
  dateElement.append(document.createTextNode(date));
  dateElement.classList.add("text-grey");

  let inner = document.createElement("div")
  inner.append(authorElement, bodyElement, dateElement);
  inner.classList.add("p-6");

  let thought = document.createElement("div")
  thought.append(inner);
  thought.classList.add("bg-white", "shadow-md", "border-b");

  document.getElementById("thoughtList").prepend(thought);
}

import {Socket} from "phoenix";

let socket = new Socket("/socket");

socket.connect();

let channel = socket.channel("thought:public");

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) });

channel.on("new_thought", payload => {
  prependBlab({author: payload.author, body: payload.body, date: payload.inserted_at});
});

let usernameInput = document.getElementById("username");
let thoughtInput = document.getElementById("thought");
let shareButton = document.getElementById("share");

shareButton.addEventListener("click", event => {
  let author = usernameInput.value;
  let body = thoughtInput.value;

  channel.push("new_thought", {author, body});

  usernameInput.value = "";
  thoughtInput.value = "";
});

