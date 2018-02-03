class RemoveQuestionFromAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :question, :string
  end
end
