class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
    render json: @reservations
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserve_date, :city, :console)
  end
end