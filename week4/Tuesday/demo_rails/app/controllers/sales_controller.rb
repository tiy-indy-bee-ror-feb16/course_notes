class SalesController < ApplicationController

  def index
    @sales = Sale.this_month
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def new
  end

  def edit
  end

end
