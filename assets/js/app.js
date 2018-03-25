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

