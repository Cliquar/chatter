App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    @appear()
  
  disconnected: ->
    # Called when the subscription has been terminated by the server
    @disappear()
  
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.sendnomsg != true
      $('.chat-window').append '<div class="message row">' +
          '<div class="message-user col-xs-4">' + data.username + ":" + '</div>' +
          '<div class="message-content col-xs-8">' + data.message + '</div>' + '</div>'
          scroll_bottom()
    $('.user_' + data.user_on).show()
    $('.user_' + data.user_off).hide()
    

  appear:  ->
    @perform ('appear')

  disappear:  ->
    @perform ('disappear')

$(document).on 'turbolinks:load', ->
  scroll_bottom()
  submit_message()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('.chat-window').scrollTop($('.chat-window')[0].scrollHeight)
