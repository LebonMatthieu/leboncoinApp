class AdvertsController < ApplicationController
  def index
    @adverts = Advert.all
  end

  def new
    @advert = Advert.new
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert = Advert.find(params[:id])

    if @advert.update(advert_params)
      redirect_to @advert
    else
      render 'edit'
    end
  end

  def create
    @advert = Advert.new(advert_params)

    @advert.save
    redirect_to @advert
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy

    redirect_to adverts_path
  end

  private
  def advert_params
    params.require(:advert).permit(:title, :description, :price)
  end
end
