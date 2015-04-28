class NewsController < ApplicationController
  def index
    @news = News.page params[:page]
    set_page_title "News"
  end

  def show
    @news = News.friendly.find(params[:id])
    @previous = News.friendly.previous(@news, 1).first
    @next = News.friendly.next(@news, 1).first
    set_page_title @news.name
  end
end