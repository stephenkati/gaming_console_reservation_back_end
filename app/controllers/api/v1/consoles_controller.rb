class Api::V1::ConsolesController < ApplicationController
  def index
    @consoles = Console.all

    if @consoles
      render json: { status: 'success', message: 'Consoles loaded', data: @consoles }, status: :ok
    else
      render json: { status: 'error', message: 'Consoles not found', data: @consoles.errors }, status: :bad_request
    end
  end

  def create
    @console = Console.new(console_params)

    if @console.save
      render json: { status: 'success', message: 'Console created', data: @console }, status: :ok
    else
      render json: { status: 'error', message: 'Console not created', data: @console.errors },
             status: :unprocessable_entity
    end
  end

  private

  def console_params
    params.require(:console).permit(:name, :purchase_price, :rental_price, :description, :photo)
  end
end
