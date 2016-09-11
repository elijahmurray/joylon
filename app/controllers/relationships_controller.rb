class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def show
    @relationship = current_user.relationships.find(params[:id])
  end

  def index
    @relationships = current_user.relationships.all
  end

  def update
    @relationship = current_user.relationships.find(params[:id])
    if @relationship.update(relationship_params)
      redirect_to @relationship
    else
      render 'edit'
    end
  end

  def edit
    @relationship = current_user.relationships.find(params[:id])
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy

    redirect_to relationships_path
  end


  def create
    @relationship = current_user.relationships.create(relationship_params)

    if @relationship.save
      redirect_to relationships_path
    else
      render 'new'
    end
  end

  def new
    @relationship = Relationship.new
  end

  private
  def relationship_params
    params.require(:relationship).permit(:name, :relationship_type)
  end
end
