class AddAboutToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :about, :text
  end
end
