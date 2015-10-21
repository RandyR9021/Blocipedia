class WikisController < ApplicationController


 def index
   @wikis = Wiki.all.order("created_at DESC")
 end

 def show
   @wikis = Wiki.find(params[:id])
 end

 def create
   @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
   if @wiki.save
     flash[:notice] = "Wiki was successfully created!"
     redirect_to @wiki
   else
     flash[:error] = "Your Wiki couldn't be saved. Please try again."
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
   @wiki = Wiki.find(params[:id])
   authorize @wiki
   if @wiki.destroy
     flash[:notice] = "Wiki was successfully deleted."
     redirect_to to wikis_path
   else
     flash[:error] = "Wiki couldn't be deleted. Please try again."
     render :show
   end
 end

 private

 def wiki_params
   params.require(:wiki).permit(:title, :body, :private, :user)
 end
end
