class AdvertsController < ApplicationController
  def index
    if params[:search]
      @adverts = Advert.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    else
      @adverts = Advert.paginate(:page => params[:page], :per_page => 3)
    end
  end

  def new
    if current_user
      @advert = Advert.new
    else
      redirect_to root_path
    end
  end

  def edit
    @advert = Advert.find(params[:id])

    if current_user
      unless current_user.id == @advert.user_id
        redirect_to advert_path , alert: "Vous n'êtes pas propriétaire de cette annonce"
      end
    else
      redirect_to advert_path , alert: "Vous devez être connecté et être propriètaire de cette annonce pour la modifier"
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
    if current_user.present?
      @advert = current_user.adverts.build(advert_params)
      if @advert.save
        redirect_to root_url
      else
        render :new
      end
    else
      redirect_to root_path , alert: "Vous devez être connecté pour publier une anonce"
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
