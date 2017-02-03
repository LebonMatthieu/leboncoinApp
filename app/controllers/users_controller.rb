class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @adverts = @user.adverts.paginate(:page => params[:page], :per_page => 3)
    else
      redirect_to root_path
    end
  end
end