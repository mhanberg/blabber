import {prependBlab, isFormSafe} from "./util.js";
import {Socket} from "phoenix";

let socket = new Socket("/socket");

socket.connect();

let channel = socket.channel("thought:public");

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) });

channel.on("new_thought", payload => {
  prependBlab(payload);
});

let usernameInput = document.getElementById("username");
let thoughtInput = document.getElementById("thought");
let shareButton = document.getElementById("share");

shareButton.addEventListener("click", () => {
  isFormSafe([usernameInput, thoughtInput], () => {
    channel.push("new_thought", {author: usernameInput.value, body: thoughtInput.value});
  });
});

