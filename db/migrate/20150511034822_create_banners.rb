class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string  :name
      t.string  :photo
      t.text    :url
      t.integer :weight

      t.timestamps
    end
  end
end
