class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.integer :user_id
      t.string :results, :default => []
      t.timestamps
    end
    add_index :answers, :user_id
  end

  def down
    drop_table :answers
  end
end
