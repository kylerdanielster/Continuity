App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
      chatroom = $("[data-behavior='messages'][data-chatroom-id=" + data.chatroom_id + "]")
      chatroom.append("<div><strong>" + data.username + ":</strong> " + data.body + "</div>")
      chatroom.scrollTop(chatroom[0].scrollHeight)
  },

  send_message: function (chatroom_id, message) {
      this.perform("send_message", { chatroom_id: chatroom_id, body: message })
  }
});
