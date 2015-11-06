class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


 def index
   @wikis = Wiki.all.order("created_at DESC")
 end

 def show
   @wiki = Wiki.find(params[:id])
 end

 def create
   @wiki = current_user.wikis.build(wiki_params)
   if @wiki.save
     flash[:notice] = "Wiki was successfully created!"
     redirect_to @wiki
   else
     flash[:error] = "Your Wiki couldn't be saved. Please try again."
     render :new
   end
 end

 def new
   @wiki = current_user.wikis.build
 end

 def update
   @wiki = Wiki.find(params[:id])
   if @wiki.update_attributes(wiki_params)
     flash[:notice] = "Wiki was successfully updated."
     redirect_to wikis_path
   else
     render "edit"
   end
 end

 def edit
   @wiki = Wiki.find(params[:id])
 end

 def destroy
   @wiki = Wiki.find(params[:id])
   if @wiki.destroy
     flash[:notice] = "Wiki was successfully deleted."
     redirect_to wikis_path
   else
     flash[:error] = "Wiki couldn't be deleted. Please try again."
     render :show
   end
 end

 private

 def wiki_params
   params.require(:wiki).permit(:title, :body, :private, :category_id, :user)
 end
end
