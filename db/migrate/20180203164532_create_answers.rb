class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :description
      t.text :source
      t.string :question
      t.string :references

      t.timestamps
    end
  end
end
