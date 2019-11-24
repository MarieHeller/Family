class FamsController < ApplicationController
  before_action :set_fam, only: [:show, :destroy, :edit, :update]

  def index
    @fams = Fam.all
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

  private

  def set_fam
    @fam = Fam.find(params[:id])
  end

  def fam_params
    params.require(:fams).permit(:name, :description, :price, :housing_type, :language, :cultural_experience, :location, :photos)
  end
end
