class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
    render json: @reservations
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    render json: @reservation
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: @reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserve_date, :city, :console)
  end
end