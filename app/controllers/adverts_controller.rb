class AdvertsController < ApplicationController
  def index
    @adverts = Advert.all
  end

  def new

  end

  def edit

  end

  def create
    @advert = Advert.new(advert_params)

    @advert.save
    redirect_to @advert
  end

  def show
    @advert = Advert.find(params[:id])
  end

  private
  def advert_params
    params.require(:advert).permit(:title, :description, :price)
  end
end
