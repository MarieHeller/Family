class FamsController < ApplicationController
  before_action :set_fam, only: [:show, :destroy, :edit, :update, :search]

  def index
    if params[:search]
      @fams = Fam.where(location: params[:search][:location])
    else
      @fams = Fam.all
    end
  end

  def show
  end

  def new
    @fam = Fam.new
  end

  def create
    @fam = Fam.new(fam_params)
    if @fam.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @fam.destroy
    redirect_to bookings_path
  end

  def edit
  end

  def update
    @fam.update(fam_params)
    redirect_to fam_path(@fam)
  end

  def search
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  private

  def set_fam
    @fam = Fam.find(params[:id])
  end

  def fam_params
    params.require(:fams).permit(:name, :description, :price, :housing_type, :language, :cultural_experience, :location, :photos, :start_date, :end_date)
  end
end
