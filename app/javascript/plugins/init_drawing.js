import Rails from '@rails/ujs';
import {create} from 'simple-drawing-board';



const initCanvas = (zone) => {
  const height = zone.offsetHeight;
  const width = zone.offsetWidth;
  zone.insertAdjacentHTML('afterbegin', `<canvas id="canvas" height="${height}" width="${width}"> </canvas>`);
}


const initDrawing = () => {
  const zone = document.querySelector('#zone');
  initCanvas(zone);


  const canvas = document.querySelector('#canvas');
  const viewer = document.querySelector('#viewer');
  const pageId = viewer.dataset.pageId;
  const annotation = viewer.dataset.annotation;
  const sdb = create(canvas);

  if (annotation !== ''){
    sdb.fillImageByDataURL(annotation);
  }



  sdb.observer.on('drawEnd', e => {
    const form = new FormData();
    form.append('data', sdb.toDataURL({type:"image/png"}, {isOverlay: true}));

    Rails.ajax({
      url: `/pages/${pageId}/annotations`,
      type: "post",
      data: form
    })
  });
}

export {initDrawing}
