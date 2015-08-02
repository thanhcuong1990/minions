class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name,       null: false, default: ""
      t.text :description,  null: false
      t.string :website,    null: false, default: ""
      t.string :image_url,  null: false, default: ""
      t.string :careers, :default => []
      t.integer :r_ranking
      t.integer :i_ranking
      t.integer :a_ranking
      t.integer :s_ranking
      t.integer :e_ranking
      t.integer :c_ranking
    end
  end
end
