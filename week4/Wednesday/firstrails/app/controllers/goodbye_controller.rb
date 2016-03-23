class GoodbyeController < ApplicationController

  def index
    @greeting = "goodbye #{params[:name].downcase || 'everybody'}!"
    render 'welcome/index'
  end

end
