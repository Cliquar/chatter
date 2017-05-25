App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.chat-window').append '<div class="message row">' +
        '<div class="message-user col-xs-4">' + data.username + ":" + '</div>' +
        '<div class="message-content col-xs-8">' + data.message + '</div>' + '</div>'