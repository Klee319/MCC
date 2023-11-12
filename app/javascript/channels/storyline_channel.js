import consumer from "channels/consumer"

// appRoomという定数に格納
consumer.subscriptions.create("StorylineChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const storylines = document.getElementById('storylines');

    if (data['action'] === 'create') {
      // 新規投稿の場合は追加する
      storylines.insertAdjacentHTML('beforeend', data['storyline']);
    } else if (data['action'] === 'update') {
      // 編集後の表記の場合は置き換える
      const existingStoryline = document.getElementById(`storyline-${data['storyline_id']}`);
      if (existingStoryline) {
        existingStoryline.innerHTML = data['storyline'];
      }
    }

    return alert(data['storyline']);
  }

});


