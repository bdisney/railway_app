class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_station_place_in_route]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to admin_railway_station_path(@railway_station), notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_station_path(@railway_station), notice: t('.notice')
    else
      render :edit
    end
  end

  def update_station_place_in_route
    @route = Route.find(params[:route_id])

    if @railway_station.update_station_place_in_route(@route, params[:position], params[:arrival_time], params[:departure_time])
      redirect_to admin_route_path(@route), notice: t('.notice')
    else
      redirect_to admin_route_path(@route), alert: t('.alert')
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path, notice: t('.notice')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
