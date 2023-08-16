class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create index destroy]

  def index
    @reservations = current_user.reservations
    render json: @reservations
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = current_user.reservations.find_by(id: params[:id])
    if @reservation
      @reservation.destroy
      render json: { message: 'Reservation destroyed' }, status: :ok
    else
      render json: { error: 'Reservation not found' }, status: :not_found
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserve_date, :city, :console_id)
  end
end
