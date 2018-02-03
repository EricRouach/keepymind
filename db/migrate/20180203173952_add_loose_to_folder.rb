class AddLooseToFolder < ActiveRecord::Migration[5.1]
  def change
    add_column :folders, :loose, :string
  end
end
