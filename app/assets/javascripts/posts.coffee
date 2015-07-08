$(document).on 'ready page:load', ->
  pusher = new Pusher('dccf42beb45019a8ff1c', encrypted: true)
  channel = pusher.subscribe('kaqi_channel')
  channel.bind 'kaqi_event', (data) ->
    $("#post_index").prepend("<tr><td><a href='/posts/#{data.post.id}'>#{data.post.name}</a></td><td></td></tr>")