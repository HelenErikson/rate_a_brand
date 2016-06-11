class Brand < ActiveRecord::Base

  validates :user, :presence => true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  has_many :ratings, :class_name => "Rating", :foreign_key => "brand_id"
  has_many :comments, :class_name => "Comment", :foreign_key => "brand_id"

  has_many :raters, :through => :ratings, :source => :user

end
