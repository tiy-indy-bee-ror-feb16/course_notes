class VotesController < ApplicationController

  def create
    @link = Link.find(params[:id])
    @link.votes.create
    redirect_to :root
  end

end
