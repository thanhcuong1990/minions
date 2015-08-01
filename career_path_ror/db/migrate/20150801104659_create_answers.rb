class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.string :user_id
      t.text :results, array: true, default: []
      t.timestamps
    end
  end

  def down
    drop_table :answers
  end
end
