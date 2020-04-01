class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def show
    @news = News.find_by!(slug: params[:id])
  end

end
