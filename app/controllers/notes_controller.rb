class NotesController < ApplicationController

  def create
    @note = Note.new note_params
    @note.goal_id = params[:goal_id]

    @note.save

    redirect_to goal_path(@note.goal)
  end

private

  def note_params
    params.require(:note).permit(:date, :body)
  end

end
