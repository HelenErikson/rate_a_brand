class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :image_url
      t.integer :user_id
      t.integer :review_id

      t.timestamps

    end
  end
end
