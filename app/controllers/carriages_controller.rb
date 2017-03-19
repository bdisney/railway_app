class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new

    if @carriage.save
      redirect_to @carriage, notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage, notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to @carriages_path, notice: 'Carriage was successfully deleted.'  
  end

  private

  def carriage_params
    params.require(:carriage).permit(:category, :top_seats, :bottom_seats, :train_id)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

end