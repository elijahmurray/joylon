class RemindersController < ApplicationController
  def create
    @relationship = Relationship.find(params[:relationship_id])
    @reminder = @relationship.reminders.create(reminder_params)
    redirect_to relationship_path(@relationship)
  end

  def destroy
    @relationship = Relationship.find(params[:relationship_id])
    @reminder = @relationship.reminders.find(params[:id])
    @reminder.destroy

    redirect_to relationship_path(@relationship)
  end

  private
  def reminder_params
    params.require(:reminder).permit(:date, :note)
  end
end
