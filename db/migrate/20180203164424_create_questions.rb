class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :description
      t.string :starred
      t.references :user, foreign_key: true
      t.references :folder, foreign_key: true

      t.timestamps
    end
  end
end
