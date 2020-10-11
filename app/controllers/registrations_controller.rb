class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @profile = @user.build_profile
  end
end