class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :photo
      t.text :detail
      t.integer :weight
      t.string :slug

      t.timestamps
    end
  end
end
