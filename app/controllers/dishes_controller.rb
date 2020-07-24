class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    # require "pry"; binding.pry
  end

end
