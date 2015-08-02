class CreateCareer < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :personality_id, null: false
      t.timestamps
    end
    add_index :careers, :name
    add_index :careers, :description

  end
end
