class WikiController < ApplicationController
  before_action :find_wiki, only: [:show]
  before_action :authenticate_user!

  def index
    @wikis = Wiki.all.order("created_at DESC")
  end

  def show
    @wikis = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
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
    authorize @wiki
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user)
end

  def find_wiki
    @wiki = wiki.find(params[:id])
  end
end
