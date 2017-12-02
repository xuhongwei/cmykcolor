class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name, :null => false
      t.string :content, :null => false
      t.integer :weight, :default => 0, :null => false
      t.integer :product_id, :null => false

      t.timestamps
    end
  end
end
