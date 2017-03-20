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
    if Carriage::TYPES.key?(params[:carriage][:type].to_sym)
      carriage_class = params[:carriage][:type].constantize
      @carriage = carriage_class.new(carriage_params(carriage_class))
      if @carriage.save
        redirect_to carriage_path(@carriage), notice: 'Carriage was successfully created.'
      else
        render :new
      end
    else
      redirect_to new_carriage_path(@carriage), notice: 'Something wrong.'
    end
  end

  def update
    if @carriage.update(carriage_params(@carriage.class))
      redirect_to carriage_path(@carriage), notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path, notice: 'Carriage was successfully deleted.'  
  end

  private

  def carriage_params(carriage_class)
    params.require(:carriage).permit(carriage_class.permited_params)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

end