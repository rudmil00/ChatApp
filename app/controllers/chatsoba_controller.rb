class ChatsobaController < ApplicationController
    before_action :require_user
  def index
    @poruka = Poruka.new
    @porukas = Poruka.all 
  end
end
