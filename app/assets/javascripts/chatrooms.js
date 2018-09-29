$(document).on('turbolinks:load', function() {
    $("#new_message").keypress(function(e) {
        if(e && e.keyCode === 13) {
            e.preventDefault()
            $(this).submit()
        }
    });

    $("#new_message").submit(function(e) {
        e.preventDefault()

        var chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
        var body = $("#message_body")

        App.chatrooms.send_message(chatroom_id, body.val())

        body.val("")
    });
});


