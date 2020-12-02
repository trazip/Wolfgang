import CableReady from 'cable_ready'
import consumer from './consumer'

consumer.subscriptions.create('DrawingChannel', {
  received (data) {
    const pageId = document.querySelector("#viewer").dataset.pageId
    console.log(data.operations)
    if (data.cableReady) {
      if (data.operations.dispatchEvent[0].detail.pageId === pageId) {
        CableReady.perform(data.operations)
      }
    }
  }
})
