class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :brand_id
      t.text :body

      t.timestamps

    end
  end
end
