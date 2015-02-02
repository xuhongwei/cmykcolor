class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, default: "Ink", null: false
      t.integer :weight, default: 0, null:false

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
