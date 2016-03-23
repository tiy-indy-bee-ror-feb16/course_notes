class WelcomeController < ApplicationController
  def index
    if params[:name]
      redirect_to show_path params[:name]
    else
      @greeting = "hello everybody!"
    end
  end

  def show
    @greeting = "Hello, #{params[:name]}!"
    render :index, layout: 'application'
  end

  def lipsum
    @lipsum = Lipsum.new(params[:lipsum], params[:num] || 1)
  end
end
