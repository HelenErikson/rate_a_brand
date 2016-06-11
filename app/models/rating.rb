class Rating < ActiveRecord::Base

  validates :user, :presence => true, :uniqueness => { :scope => :brand }
  # validates :user, :presence => true, :uniqueness => { :scope => :user }
  validates :brand, :presence => true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :brand, :class_name => "Brand", :foreign_key => "brand_id"

end
