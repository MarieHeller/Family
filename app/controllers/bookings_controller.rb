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

  def edit
    set_booking
  end

  def update
    set_booking
    if @booking.update(booking_params)
      redirect_to @booking, notice: "Successfully changed your booking!"
    else
      render :edit
    end
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to profile_path(current_user), notice: "Booking Canceled!"
  end

  def accept
    set_booking
    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to @booking, notice: "Booking accepted"
  end

  def decline
    set_booking
    authorize @booking
    @booking.status = "declined"
    @booking.save
    redirect_to @booking, notice: "Booking declined"
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
