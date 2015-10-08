class WikiController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wikis = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new (params.require(:wiki).permit(:title, :body, :private))
    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:error] = "Wiki couldn't be saved. Please try again."
      render :new
    end
  end

  def new
    @wiki = Wiki.new
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
end

  def find_wiki
    @wiki = wiki.find(params[:id])
  end
end
