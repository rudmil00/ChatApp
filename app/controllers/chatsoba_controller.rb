class ChatsobaController < ApplicationController
  def index
    @porukas=Poruka.all 
  end
end
