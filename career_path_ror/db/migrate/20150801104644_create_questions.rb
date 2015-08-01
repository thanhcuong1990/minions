class CreateQuestions < ActiveRecord::Migration

  def up
    create_table :personality_types do |t|
      t.string :name
      t.timestamps
    end

    create_table :questions do |t|
      t.string :content
      t.integer :personality_id
      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end