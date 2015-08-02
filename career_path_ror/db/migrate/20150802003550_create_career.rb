class CreateCareer < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false
      t.integer :personality_id, null: false
      t.timestamps
    end
    add_index :careers, :name

  end
end
