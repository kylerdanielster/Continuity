App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
      $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom.id}']").append(data.message)
  },

  send_message: function (chatroom_id, message) {
      this.perform("send_message", { chatroom_id: chatroom_id, body: message })
  }
});
