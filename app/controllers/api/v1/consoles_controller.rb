class Api::V1::ConsolesController < ApplicationController
  def index
    @consoles = Console.all

    if @consoles
      render json: { status: 'success', message: 'Consoles loaded', data: @consoles }, status: :ok
    else
      render json: { status: 'error', message: 'Consoles not found', data: @consoles.errors }, status: :bad_request
    end
  end

  def show
    @console = Console.find_by(id: params[:id])

    if @console
      render json: { status: 'success', message: 'Console loaded', data: @console }, status: :ok
    else
      render json: { status: 'error', message: 'Console not found', data: nil }, status: :not_found
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

  def destroy
    @console = Console.find_by(id: params[:id])

    if @console.nil?
      render json: { status: 'error', message: 'Console not found', data: nil }, status: :not_found
    elsif @console.destroy
      render json: { status: 'success', message: 'Console deleted', data: @console }, status: :ok
    end
  end

  private

  def console_params
    params.require(:console).permit(:name, :purchase_price, :rental_price, :description, :photo)
  end
end
