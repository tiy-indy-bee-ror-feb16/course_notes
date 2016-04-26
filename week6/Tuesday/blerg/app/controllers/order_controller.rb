class OrderController < ApplicationController

  def show
    @sale = Payola::Sale.find(params[:id])
    if @sale.product.is_a? Post
      OrderMailer.order_complete(@sale).deliver_later
    elsif @sale.product.is_a? Author
      BundleAuthorPostsJob.perform_later(@sale.product.id, @sale.id)
    end
  end


end
