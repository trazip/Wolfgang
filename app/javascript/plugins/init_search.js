const initSearch = () => {
  const input = document.querySelector("#search");
  const submit = document.querySelector("#submit");
  if (input) {
    input.addEventListener("keyup", e => {
      submit.click();
    })
  }
}

export { initSearch };
