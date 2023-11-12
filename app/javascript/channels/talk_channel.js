import consumer from "channels/consumer"
// appRoomという定数に格納

function scrollToBottom() {
  var container = document.getElementById('talks-container');
  container.scrollTop = container.scrollHeight;
}

consumer.subscriptions.create("TalkChannel", {
  connected() {
    scrollToBottom();
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const talks = document.getElementById('talks');
    if (data['action'] === 'create') {
      // 新規投稿の場合は追加する
      talks.insertAdjacentHTML('beforeend', data['talk']);
      scrollToBottom();
      const form = document.getElementById('your-form-id'); // フォーム要素のIDを指定
      form.reset();
    } else if (data['action'] === 'update') {
      // 編集後の表記の場合は置き換える
      const existingTalk = document.getElementById(`talk-${data['talk_id']}`);
      if (existingTalk) {
        existingTalk.innerHTML = data['talk'];
      }
    }
    //return alert(data['talk']);

  }

});
