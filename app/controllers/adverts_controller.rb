class AdvertsController < ApplicationController
  def index
    if params[:search]
      @adverts = Advert.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    else
      @adverts = Advert.paginate(:page => params[:page], :per_page => 2)
    end
  end

  def new
    @advert = Advert.new
  end

  def edit
    @advert = Advert.find(params[:id])

    unless current_user.id == @advert.user_id
      redirect_to advert_path , alert: "Vous n'êtes pas propriétaire de cette annonce"
    end
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
    @advert = current_user.adverts.build(advert_params)

    if @advert.save
      redirect_to root_url
    else
      render :new
    end
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
    params.require(:advert).permit(:title, :description, :price, :image, :category_id, :user_id)
  end
end
