import Rails from '@rails/ujs';
import {create} from 'simple-drawing-board';
import _ from 'lodash';

const sleep = (ms) => {
  return new Promise(resolve => setTimeout(resolve, ms))
}

const initCanvas = async (zone) => {
  await sleep(100)
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



const initDrawing = async () => {
  const zone = document.querySelector('#zone');
  console.log('init drawing')
  if (zone) {
    await initCanvas(zone);

    const actionButtons = document.querySelectorAll("#tools button");
    const undo = document.querySelector('#undo');
    const clear = document.querySelector('#clear');
    const pen = document.querySelector('#pen');
    const eraser = document.querySelector('#eraser');
    const canvas = document.querySelector('#canvas');
    const pageId = viewer.dataset.pageId;
    const annotation = viewer.dataset.annotation;
    const ownerId = viewer.dataset.ownerId;
    const userId = viewer.dataset.userId;
    const sdb = create(canvas);
    sdb.setLineSize(2);

    if (ownerId === userId) {
      sdb.setLineColor("#FF1616");
    } else {
      sdb.setLineColor("#5271FF");
    }

    if (actionButtons) {
      actionButtons.forEach((button) => {
        button.addEventListener('click', async (e) => {
          if (!(button.getAttribute('id') == 'undo' || button.getAttribute('id') == 'clear')) {
            // remove color for everybody
            actionButtons.forEach((actionButton) => {
              const svg = actionButton.querySelector('svg');
              svg.setAttribute('fill', 'none');
              const svgG = svg.querySelector('g');
              if (svgG) {
                svgG.setAttribute('fill', 'none');
              }
            })
            let svg
            if (button.getAttribute('id') == 'eraser') {
              svg = button.querySelector('svg g');
            } else {
              svg = button.querySelector('svg');
            }
            svg.setAttribute('fill', '#ffb700');
          }
          if (button.getAttribute('id') == 'pen') {
            if (sdb.mode == "erase") {
              sdb.toggleMode();
              sdb.setLineSize(2);
            }
          }
          if (button.getAttribute('id') == 'eraser') {
            if (sdb.mode == "draw") {
              sdb.toggleMode();
              sdb.setLineSize(30);
            }
          }
          if (button.getAttribute('id') == 'undo') {
            await sdb.undo();
            submitData(sdb, pageId);
          }
          if (button.getAttribute('id') == 'clear') {
            sdb.clear();
            submitData(sdb, pageId);
          }
        })
      })
    }

    if (annotation !== ''){
      sdb.fillImageByDataURL(annotation);
    }



    sdb.observer.on('drawEnd', e => {
      submitData(sdb, pageId);
    });

    const draw = () => {
      const form = new FormData();
      form.append('data', sdb.toDataURL({type:"image/png"}, {isOverlay: true}));

      Rails.ajax({
        url: `/drawing?page_id=${pageId}`,
        type: "post",
        data: form
      })
    }

    sdb.observer.on('draw', _.throttle(draw, 1000));

    viewer.addEventListener('drawing', (event) => {
      if (sdb.mode === 'draw') {
      sdb.fillImageByDataURL(event.detail.data);
      }
    })
  }
}

export {initDrawing}
