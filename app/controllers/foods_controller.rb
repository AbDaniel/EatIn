class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      render 'new'
    end
  end

  def update
    @food = Food.find(params[:id])

    if @food.update(food_params)
      redirect_to @food
    else
      render 'edit'
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :text)
  end

end
