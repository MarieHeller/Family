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
    @fam.user = current_user
    if @fam.save
      create_pictures
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
    params.require(:fam).permit(:name, :description, :price, :housing_type, :language, :cultural_experience, :location, :pictures, :start_date, :end_date)
  end

  def user_params
    params.require(:user).permit(:id, :first_name)
  end

  def create_pictures
    photos = params.dig(:product, :pictures) || []
    photos.each do |photo|
      @product.pictures.create(photo: photo)
    end
  end
end
