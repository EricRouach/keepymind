class QuestionsController < ApplicationController
  before_action :set_question, only: %i[edit update destroy show]

  def new
    @question = Question.new
    @folders = Folder.where(user_id: current_user.id, loose: "false")
    @folder_selected = params[:folder_id] unless params[:folder_id].nil?
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
    @answer = Answer.new(description: params[:question][:answer], source: params[:question][:source])
    @answer.question_id = @question.id
    @question.answers << @answer
    if @question.save!
      redirect_to folders_path
    else
      redirect_to new_question_path, alert: "Something went wrong"
    end
  end

  def show
  end

  def edit
    @folders = Folder.where(user_id: current_user.id, loose: "false")
  end

  def update
    @question.update(question_params)
    answer = Answer.find_by(question_id: @question.id)
    answer.description = params[:question][:answer]
    answer.source = params[:question][:source]
    answer.save
    redirect_to question_path(@question.id)
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
    params.require(:question).permit(:description, :folder_id)
  end
end
