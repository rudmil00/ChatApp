class MessagesController < ApplicationController
    before_action :require_user
  
    def create
      poruka = current_user.porukas.build(poruka_params)
      if poruka.save
        redirect_to root_path
      end
    end
  
    private
  
    def poruka_params
      params.require(:poruka).permit(:body)
    end
  
  end