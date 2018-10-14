const prependBlab = function({template: thought}) {
  const thoughtNode = document.createElement("div");

  document.getElementById("thoughtList").prepend(thoughtNode);
  thoughtNode.outerHTML = thought;
};

const isFormSafe = (inputs, onSuccess) => {
  const formValidation = inputs.reduce((acc, input) => {
    if (input.value.trim().length === 0) {
      input.classList.add("border-red");

      acc.safe = false;
    } else {
      input.classList.remove("border-red");
    }

    return acc;
  }, {safe: true});

  if (!formValidation.safe) {
    return;
  }

  onSuccess();

  username.value = "";
  username.classList.remove("border-red");
  thought.value = "";
  thought.classList.remove("border-red");
};

export {
  prependBlab,
  isFormSafe
}
