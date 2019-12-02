class BusesController < ApplicationController
  def create
    @bus = Bus.new(bus_params)

    byebug
    
    if @bus.save
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  private
    def bus_params
      params.require(:bus).permit(:route_name)
    end
end
