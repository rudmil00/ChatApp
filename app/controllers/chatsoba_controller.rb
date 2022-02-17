class ChatsobaController < ApplicationController
    before_action :require_user
  def index
    @poruka = Poruka.new
    @porukas = Poruka.custom_display
  end
end
