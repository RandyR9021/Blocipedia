class CollaboratorsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end

  private

  def collaborator_params
    params.require(:collaborator).permit[:user_id, :wiki_id]
  end
end
