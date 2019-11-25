class FamsController < ApplicationController
  before_action :set_fam, only: [:show, :destroy, :edit, :update, :search]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:search]
      @fams = policy_scope(Fam).where(location: params[:search][:location])
    else
      @fams = policy_scope(Fam).all
    end
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

  def search
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  private

  def set_fam
    @fam = Fam.find(params[:id])
    authorize @fam
  end

  def fam_params
    params.require(:fams).permit(:name, :description, :price, :housing_type, :language, :cultural_experience, :location, :photos, :start_date, :end_date)
  end

  def user_params
    params.require(:user).permit(:id, :first_name)
  end
end
