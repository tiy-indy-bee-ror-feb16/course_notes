class CarrotsController < ApplicationController
  def show
    @carrot = Carrot.find_by(name: "^#{params[:id]}")
    @cheeps = @carrot.cheeps.page(params[:page])
  end
end
