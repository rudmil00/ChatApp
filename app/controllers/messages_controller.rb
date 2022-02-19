class MessagesController < ApplicationController
    before_action :require_user
  
    def create
      poruka = current_user.porukas.build(poruka_params)
      if poruka.save
        ActionCable.server.broadcast("chatsoba_channel", prikazi_poruku(poruka))
      end
    end
  
    private
  
    def poruka_params
      params.require(:poruka).permit(:body)
    end
    

    def prikazi_poruku(message)
      render(partial: 'poruka/poruka', locals: {poruka: message})
    end

  end