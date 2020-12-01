import Rails from '@rails/ujs';
import {create} from 'simple-drawing-board';

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

    // pen.addEventListener('click', e => {
    //   if (pen.innerHTML === '<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="#ffb700" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>') {
    //     sdb.toggleMode();
    //     pen.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>';
    //     eraser.innerHTML = '<svg width="25" height="25" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 56 56" version="1.1" x="0px" y="0px"><g stroke="none" stroke-width="1" fill="#ffb700" fill-rule="evenodd"><g transform="translate(-98.000000, -503.000000)"><g transform="translate(96.000000, 501.000000)"><g transform="translate(30.577329, 30.569497) rotate(-315.000000) translate(-30.577329, -30.569497) translate(13.077329, 5.069497)"><path d="M8.30668865,0.378864595 C3.89333881,0.378864595 0.315611875,3.95467558 0.315611875,8.38449753 L0.315611875,42.3732317 C0.315611875,46.7946206 3.90492134,50.3788646 8.30668865,50.3788646 L24.9908384,50.3788646 C29.4041882,50.3788646 32.9819151,46.8030536 32.9819151,42.3732317 L32.9819151,8.38449753 C32.9819151,3.96310855 29.3926057,0.378864595 24.9908384,0.378864595 L8.30668865,0.378864595 Z" stroke="#000000" stroke-width="2.5"/><path d="M0.56672679,22.1909249 L33.6632056,22.1909249" stroke="#000000" stroke-width="6"/><polygon fill="#000000" points="0.767269683 23.5934207 0.484522928 4.60483602 5.73687678 0.628321036 28.3917518 0.628321036 33.0912547 6.6731214 33.0912547 23.436363"/></g><path d="M23.3893329,55.7915096 L56.176283,55.7915096" stroke="#000000" stroke-width="2.5" stroke-linecap="round"/></g></g></g></svg>';
    //     sdb.setLineSize(30);
    //   }
    // })

    // eraser.addEventListener('click', e => {
    //   if (eraser.innerHTML === '<svg width="25" height="25" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 56 56" version="1.1" x="0px" y="0px"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-98.000000, -503.000000)"><g transform="translate(96.000000, 501.000000)"><g transform="translate(30.577329, 30.569497) rotate(-315.000000) translate(-30.577329, -30.569497) translate(13.077329, 5.069497)"><path d="M8.30668865,0.378864595 C3.89333881,0.378864595 0.315611875,3.95467558 0.315611875,8.38449753 L0.315611875,42.3732317 C0.315611875,46.7946206 3.90492134,50.3788646 8.30668865,50.3788646 L24.9908384,50.3788646 C29.4041882,50.3788646 32.9819151,46.8030536 32.9819151,42.3732317 L32.9819151,8.38449753 C32.9819151,3.96310855 29.3926057,0.378864595 24.9908384,0.378864595 L8.30668865,0.378864595 Z" stroke="#000000" stroke-width="2.5"/><path d="M0.56672679,22.1909249 L33.6632056,22.1909249" stroke="#000000" stroke-width="6"/><polygon fill="#000000" points="0.767269683 23.5934207 0.484522928 4.60483602 5.73687678 0.628321036 28.3917518 0.628321036 33.0912547 6.6731214 33.0912547 23.436363"/></g><path d="M23.3893329,55.7915096 L56.176283,55.7915096" stroke="#000000" stroke-width="2.5" stroke-linecap="round"/></g></g></g></svg>') {
    //     sdb.toggleMode();
    //     eraser.innerHTML = '<svg width="25" height="25" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 56 56" version="1.1" x="0px" y="0px"><g stroke="none" stroke-width="1" fill="#ffb700" fill-rule="evenodd"><g transform="translate(-98.000000, -503.000000)"><g transform="translate(96.000000, 501.000000)"><g transform="translate(30.577329, 30.569497) rotate(-315.000000) translate(-30.577329, -30.569497) translate(13.077329, 5.069497)"><path d="M8.30668865,0.378864595 C3.89333881,0.378864595 0.315611875,3.95467558 0.315611875,8.38449753 L0.315611875,42.3732317 C0.315611875,46.7946206 3.90492134,50.3788646 8.30668865,50.3788646 L24.9908384,50.3788646 C29.4041882,50.3788646 32.9819151,46.8030536 32.9819151,42.3732317 L32.9819151,8.38449753 C32.9819151,3.96310855 29.3926057,0.378864595 24.9908384,0.378864595 L8.30668865,0.378864595 Z" stroke="#000000" stroke-width="2.5"/><path d="M0.56672679,22.1909249 L33.6632056,22.1909249" stroke="#000000" stroke-width="6"/><polygon fill="#000000" points="0.767269683 23.5934207 0.484522928 4.60483602 5.73687678 0.628321036 28.3917518 0.628321036 33.0912547 6.6731214 33.0912547 23.436363"/></g><path d="M23.3893329,55.7915096 L56.176283,55.7915096" stroke="#000000" stroke-width="2.5" stroke-linecap="round"/></g></g></g></svg>';
    //     pen.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>';
    //     sdb.setLineSize(2);
    //   }
    // })



    // clear.addEventListener('click', e => {
    //   sdb.clear();
    //   submitData(sdb, pageId);
    // })

    // undo.addEventListener('click', async (e) => {
    //   await sdb.undo();
    //   submitData(sdb, pageId);
    // })
  }
}

export {initDrawing}
