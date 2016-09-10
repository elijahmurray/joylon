class RelationshipsController < ApplicationController
  def show
    @relationship = Relationship.find(params[:id])
  end

  def index
    @relationships = Relationship.all
  end

  def update
    @relationship = Relationship.find(params[:id])
    if @relationship.update(relationship_params)
      redirect_to @relationship
    else
      render 'edit'
    end
  end

  def create
    @relationship = Relationship.new(relationship_params)
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
    params.require(:relationship).permit(:name, :relationship_type, :reminder_frequency)
  end
end
