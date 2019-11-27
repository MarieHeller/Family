class BookingsController < ApplicationController
  # before_action :set_booking, only: []
  before_action :set_fam, only: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    authorize @fam
    @booking.user = current_user
    @booking.fam = @fam
    if @booking.save
      redirect_to @booking, notice: "Successfully booked your family!"
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:number_of_guests, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_fam
    @fam = Fam.find(params[:fam_id])
  end
end
