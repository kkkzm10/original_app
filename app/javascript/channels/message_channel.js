import consumer from "./consumer"

const appMessage = consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

window.addEventListener("keypress", function(e) {
  if (e.keyCode === 13) {
    appMessage.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
})
