class CreateQuestions < ActiveRecord::Migration

  def up
    create_table :personality_types do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.timestamps
    end

    create_table :questions do |t|
      t.string :content
      t.integer :personality_id
      t.timestamps
    end

    add_index :questions, :content,                unique: true
    add_index :personality_types, :name,           unique: true
  end

  def down
    drop_table :questions
  end
end
