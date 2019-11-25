class ProfilesController < ApplicationController
  def show
    set_profile
  end

  def edit
    set_profile
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :language, :age, :nationality, :photo, :gender)
  end
end
