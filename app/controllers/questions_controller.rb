class QuestionsController < ApplicationController
  before_action :set_question, only: %i[edit update destroy]

  def new
    @question = Question.new
    @folders = Folder.where(user_id: current_user.id, loose: "false")
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if params[:question][:folder_id].empty?
      @folder = Folder.find_by(user_id: current_user.id, loose: "true")
    else
      @folder = Folder.find(params[:question][:folder_id])
    end
    @question.folder = @folder
    @answer = Answer.new(description: params[:question][:answer], source: params[:question][:source], question_id: @question.id)
    @question.answer = @answer
    if @question.save!
      redirect_to folders_path
    else
      redirect_to new_question_path, alert: "Something went wrong"
    end
  end

  def edit
    @folders = Folder.where(user_id: current_user.id, loose: "false")
  end

  def update
  end

  def destroy
    @question.destroy
    redirect_to folders_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:description)
  end
end
