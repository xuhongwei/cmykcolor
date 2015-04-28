class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.string :photo
      t.text :detail
      t.integer :weight
      t.string :slug

      t.timestamps
    end
  end
end
