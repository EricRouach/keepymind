class FoldersController < ApplicationController
  before_action :set_folder, only: %i[show edit update destroy]

  def index
    @folders = Folder.where(user_id: current_user.id, loose: "false")
    @loose_folder = Folder.find_by(user_id: current_user.id, loose: "true")
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.user = current_user
    if @folder.save!
      redirect_to folders_path
    else
      redirect_to new_folder_path, alert: 'Something went wrong'
    end
  end

  def show
  end

  def edit;end

  def update
    @folder.update(folder_params)
    if @folder.save
      redirect_to folders_path
    else
      redirect_to edit_folder_path(folder.id), alert: 'Something went wrong'
    end
  end

  def destroy
    @folder.destroy
    redirect_to folders_path
  end

  private

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
