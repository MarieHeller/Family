class BookingsReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @booking_review = BookingsReview.new
    authorize @booking_review
    authorize @booking
  end

  def create
    @bookings_review = BookingsReview.new(bookings_review_params)
    booking = Booking.find(params[:booking_id])
    @bookings_review.booking = booking
    authorize @bookings_review
    if @bookings_review.save
      redirect_to profile_path(current_user)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def bookings_review_params
    params.require(:bookings_review).permit(:content, :rating)
  end
end
