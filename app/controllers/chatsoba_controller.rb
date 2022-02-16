class ChatsobaController < ApplicationController
    before_action :require_user
  def index
    @porukas=Poruka.all 
  end
end
