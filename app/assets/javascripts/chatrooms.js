$(document).on('turbolinks:load', function() {
    $("#new_message").on("keypress", (e) => {
        if(e.which === 13) {
            e.preventDefault()
            e.currentTarget.submit()
        }
    });
});

