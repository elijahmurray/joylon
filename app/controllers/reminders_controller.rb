class RemindersController < ApplicationController
  def show
    @relationship = Relationship.find(params[:relationship_id])
    @reminder = Reminder.find(params[:id])
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def update
    @reminder = Reminder.find(params[:id])
    @reminder.update_attributes(reminder_params)
  end

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
    params.require(:reminder).permit(:date, :note, :frequency, :status)
  end
end
