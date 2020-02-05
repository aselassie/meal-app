class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def show
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @meal.update(meal_params)
    redirect_to meal_path(@meal)
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(%i[name description category price city])
  end
end

