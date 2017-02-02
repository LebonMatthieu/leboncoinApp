class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @adverts = @user.adverts.paginate(:page => params[:page], :per_page => 2)
  end
end
