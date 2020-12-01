const initNewCollectionBtn = () => {
  const btn = document.querySelector("#new_collection_btn");
  const shareModal = document.querySelector("#shareModal");

  if (btn) {
    btn.addEventListener('click', e => {
      $(function () {
         $('#shareModal').modal('toggle');
      });
    })
  }
}

export {initNewCollectionBtn}
