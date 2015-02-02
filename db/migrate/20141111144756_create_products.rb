class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :photo, null: false
      t.text :brief, null: false
      t.text :detail, null: false
      t.integer :category_id
      t.integer :weight, default: 0, null: false

      t.timestamps
    end

    add_index :products, :name, unique: true
    add_index :products, :category_id
  end
end
