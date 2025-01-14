class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile,

  def show
  end
  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to todos, notice: "Profile updated successfully!"
    else
      render :edit
    end
  end


  private

  def set_profile
    @profile = current_user.profile || current_user.create_profile
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar)
  end
end
