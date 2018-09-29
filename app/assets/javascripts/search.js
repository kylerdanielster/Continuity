$(document).on('turbolinks:load', function() {
    // This should be a search controller at some point
    $input = $("[data-behavior='autocomplete']")

    var options = {
        getValue: "value",
        url: function(phrase) {
            return "/search.json?q=" + phrase;
        },
        categories: [
            {
                listLocation: "questions",
                header: "<strong>Questions</strong>",
            },
            {
                listLocation: "details",
                header: "<strong>Question Details</strong>",
            },
            {
                listLocation: "answers",
                header: "<strong>Answers</strong>",
            },
            {
                listLocation: "messages",
                header: "<strong>Messages</strong>",
            }
        ],
        list: {
            onChooseEvent: function() {
                var url = $input.getSelectedItemData().url
                $input.val("")
                Turbolinks.visit(url)
            }
        }
    }

    $input.easyAutocomplete(options)
});