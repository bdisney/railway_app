class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:index, :new, :create]

  def index
    redirect_to admin_train_path(@train)
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
      @carriage.train = @train
      if @carriage.save
        redirect_to admin_train_path(@train), notice: t('.notice')
      else
        render :new
      end
    else
      redirect_to new_admin_train_carriage_path, alert: t('.alert')
    end
  end

  def update
    if @carriage.update(carriage_params(@carriage.class))
      redirect_to admin_carriage_path(@carriage), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    train = @carriage.train
    @carriage.destroy
    redirect_to admin_train_path(train), notice: t('.notice')  
  end

  private

  def carriage_params(carriage_class)
    params.require(:carriage).permit(carriage_class.permited_params)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

end