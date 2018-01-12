// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

addEventListener('DOMContentLoaded', () => {
  if (location.search == "") return

  logged_in.innerText = location.search.substr(1)

  const chat_channel = App.cable.subscriptions.create('ChatChannel', {
    connected: () => {messages.append('connected\n')},
    disconnected: () => {messages.append('disconnected\n')},
    received: data => {
      messages.append(`${data.username}: ${data.message}\n`)
      console.log('Received data from server:', data);
    }
  })

  form_message.addEventListener('submit', e => {
    e.preventDefault()
    const username = location.search.substr(1)
    const message = text_message.value
    const room = the_room.innerText
    chat_channel.send({ username, message, room })
    text_message.value = ''
  })


})
