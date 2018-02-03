class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :ratio
      t.references :user, foreign_key: true
      t.string :question
      t.string :references

      t.timestamps
    end
  end
end
