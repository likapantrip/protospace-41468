class UsersController < ApplicationController
  def create
    Prototype.create(params_user)
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes

  end

  private
  def params_user
    params.require(:user).permit(:email, :password, :name, :profile, :occupation, :position)
  end
end
