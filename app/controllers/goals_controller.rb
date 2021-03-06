class GoalsController < ApplicationController
before_filter :require_login

  def show
    @goal = Goal.find params[:id]

    @note = Note.new
    @note.goal_id = @goal.id
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new goal_params
    @goal.user_id = current_user.id
    @goal.save
    redirect_to goal_path(@goal)
  end

  def edit
    @goal = Goal.find params[:id]
  end

  def update
    @goal = Goal.find params[:id]
    @goal.update goal_params
    redirect_to goal_path(@goal)
  end

  def destroy
    @goal = Goal.find params[:id]
    @goal.destroy
    redirect_to goals_path
  end

private

  def goal_params
    params.require(:goal).permit(:title, :body, :deadline)
  end

end
