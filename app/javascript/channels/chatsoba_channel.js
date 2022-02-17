import consumer from "channels/consumer"




consumer.subscriptions.create("ChatsobaChannel", {



  
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#polje-za-poruke').append(data)
    
    // $('#message_body').on('keydown', function(e) {
    //   if (e.keyCode == 13) {
    //     $('button').click();
    //     e.target.value = "";
    //   };
    // });

  
    if ($('#poruke').length > 0) {
      $('#poruke').scrollTop($('#poruke')[0].scrollHeight)
    }

    
  }
})
