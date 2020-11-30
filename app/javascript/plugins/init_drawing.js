import Rails from '@rails/ujs';
import {create} from 'simple-drawing-board';

const initCanvas = (zone) => {
  const height = zone.offsetHeight;
  const width = zone.offsetWidth;
  zone.insertAdjacentHTML('afterbegin', `<canvas id="canvas" height="${height}" width="${width}"> </canvas>`);
}

const submitData = (sdb, pageId) => {
  const form = new FormData();
    form.append('data', sdb.toDataURL({type:"image/png"}, {isOverlay: true}));

    Rails.ajax({
      url: `/pages/${pageId}/annotations`,
      type: "post",
      data: form
  })
}


const initDrawing = () => {
  const viewer = document.querySelector('#viewer');
  const pdfPages = viewer.dataset.pdfPages;
  const imgPages = viewer.dataset.imgPages;
  const zone = document.querySelector('#zone');
  if (zone && (pdfPages === imgPages)) {
    initCanvas(zone);

    const undo = document.querySelector('#undo');
    const clear = document.querySelector('#clear');
    const mode = document.querySelector('#mode');
    const canvas = document.querySelector('#canvas');
    const pageId = viewer.dataset.pageId;
    const annotation = viewer.dataset.annotation;
    const sdb = create(canvas);
    sdb.setLineSize(2);
    sdb.setLineColor("#fc2525");
    //sdb.toggleMode();

    if (annotation !== ''){
      sdb.fillImageByDataURL(annotation);
    }



    sdb.observer.on('drawEnd', e => {
      submitData(sdb, pageId);
    });

    mode.addEventListener('click', e => {
      sdb.toggleMode();
      if (mode.innerHTML === '<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle"><circle cx="12" cy="12" r="10"></circle></svg>') {
        mode.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>';
         sdb.setLineSize(2);
      } else {
        mode.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle"><circle cx="12" cy="12" r="10"></circle></svg>';
        sdb.setLineSize(30);
      }
    })

    clear.addEventListener('click', e => {
      sdb.clear();
      submitData(sdb, pageId);
    })

    undo.addEventListener('click', async (e) => {
      await sdb.undo();
      submitData(sdb, pageId);
    })
  }
}

export {initDrawing}
