class CollaboratorsController < ApplicationController

  def new
   @wiki = Wiki.find(params[:wiki_id])
   @collaborator = Collaborator.new
   @users = User.all
 end

 def create
   @wiki = Wiki.find(params[:wiki_id])
   @collaborator = Collaborator.new(collaborator_params)
   @collaborator.wiki = @wiki

   if @collaborator.save
     flash[:notice] = "Collaborator was added to this wiki."
     redirect_to @wiki
   else
     flash[:error] = "Collaborator was not added. Please try again."
     render :show
   end
  end

 def destroy
   @wiki = Wiki.find(params[:wiki_id])
   @collaborator = Collaborator.find(params[:id])

   if @collaborator.destroy
     flash[:notice] = "Collaborator was removed from this wiki."
     redirect_to @wiki
   else
     flash[:error] = "Collaborator was not removed. Please try again."
     render :show
   end
  end


  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end
