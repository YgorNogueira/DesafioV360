class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile,

  def show
  end
  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: "Profile updated"

    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar)
  end
end
