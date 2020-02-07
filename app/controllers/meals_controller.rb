class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meals = policy_scope(Meal).order(created_at: :asc)
  end

  def new
    @meal = Meal.new
    authorize @meal
  end

  def show
    authorize @meal
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    authorize @meal

    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
    authorize @meal
  end

  def update
    authorize @meal
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
    authorize @meal
  end

  def meal_params
    params.require(:meal).permit(%i[name description category price city])
  end
end
