import consumer from "channels/consumer"

// appRoomという定数に格納
consumer.subscriptions.create("FavoriteChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        const post = document.getElementById(`post-${data['post_id']}`);

        post.innerHTML = data['post'];


    }
});
