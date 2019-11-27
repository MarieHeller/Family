class FamsController < ApplicationController
  before_action :set_fam, only: [:show, :destroy, :edit, :update, :search]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:search]
      @fams = policy_scope(Fam).where("location ILIKE ?", "%#{params[:search][:location]}%")
      @markers = @fams.map do |fam|
        {
          lat: fam.latitude,
          lng: fam.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { fam: fam })
        }
      end

    else
      @fams = policy_scope(Fam).where.not(latitude: nil)
      @fams = Fam.geocoded
      @markers = @fams.map do |fam|
        {
          lat: fam.latitude,
          lng: fam.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { fam: fam })
        }
      end
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

  def edit
    @fam = Fam.find(params[:id])
    authorize @fam
  end

  def update
    authorize @fam
    if @fam.update(fam_params)
      redirect_to fam_path(@fam)
    else
      render :edit
    end
  end

def destroy
  authorize @fam
  @fam.destroy
  redirect_to fams_path
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
  photos = params.dig(:fam, :pictures) || []
  photos.each do |photo|
    @fam.pictures.create(photo: photo)
  end
end
end
