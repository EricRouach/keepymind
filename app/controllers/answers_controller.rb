class AnswersController < ApplicationController

  def index
    @answer = Answer.find_by(question_id: params[:question_id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
