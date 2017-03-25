class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end
 
  def edit
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to admin_train_path(@train), notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to admin_train_path(@train), notice: t('.notice')
    else
      render :edit
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train.destroy
    redirect_to admin_trains_path, notice: t('.notice')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id, :order_from_tail)
    end
end
