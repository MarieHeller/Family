class FamsController < ApplicationController
  before_action :set_fam, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @fams = policy_scope(Fam).all
  end

  def show
  end

  def new
    @fam = Fam.new
    authorize @fam
  end

  def create
    @fam = Fam.new(fam_params)
    authorize @fam
    if @fam.save
      redirect_to @fam, notice: "Successfully uploaded your family!"
    else
      render :new
    end
  end

  def update
    @fam.update(fam_params)
    redirect_to fam_path(@fam)
  end

  def edit
  end

  def destroy
    @fam.destroy
    redirect_to bookings_path
  end

  private

  def set_fam
    @fam = Fam.find(params[:id])
    authorize @fam
  end

  def fam_params
    params.require(:fams).permit(:name, :description, :price, :housing_type, :language, :cultural_experience, :location, :photos)
  end
end
