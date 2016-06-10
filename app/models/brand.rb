class Brand < ActiveRecord::Base

  validates :user, :presence => true

  belongs_to :user

  has_many :comments
  has_many :ratings
  has_many :raters, :through => :ratings, :source => :user

end
