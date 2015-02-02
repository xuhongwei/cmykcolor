class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, default: "page name", null:false
      t.text :detail
      t.string :page_type, default: "about", null:false
      t.integer :weight, default: 0, null:false

      t.timestamps
    end
  end
end
