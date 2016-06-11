class Comment < ActiveRecord::Base

  validates :user, :presence => true
  validates :brand, :presence => true
  validates :body, :presence => true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :brand, :class_name => "Brand", :foreign_key => "brand_id"


end
