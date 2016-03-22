class MarketingController < ApplicationController

  def index
    @greeting = params[:greeting] || "Howdy"
    render layout: false
  end

  def show
    @students = %w(James Matt Seth Kurt Ryder)
    if params[:run_me]
      render :show
    else
      render plain: "Nope"
    end
  end

  def text
    render plain: "OK"
  end

end
