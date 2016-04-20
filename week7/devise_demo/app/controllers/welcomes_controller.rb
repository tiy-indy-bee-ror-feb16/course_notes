class WelcomesController < ApplicationController
  def index
    render text: current_user.inspect
  end
end
