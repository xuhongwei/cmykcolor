class Admin::NewsController < Admin::AdminApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = initialize_grid(News,
                            order: 'updated_at',
                            order_direction: 'desc',
                            per_page: 10)
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to admin_news_url(@news), notice: t(:created_success)
    else
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def update
    if @news.update(news_params)
      redirect_to session[:previous_url] || admin_news_url(@news), notice: t(:updated_success)
    else
      render :edit
    end
  end

  def destory
    @news.destroy
    redirect_to session[:previous_url] || admin_news_url
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:name, :photo, :detail, :weight)
  end
end
