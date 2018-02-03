class RemoveReferencesFromAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :references, :string
  end
end
