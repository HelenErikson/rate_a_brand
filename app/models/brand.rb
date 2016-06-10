class Brand < ActiveRecord::Base

  validates :user, :presence => true

  belongs_to :user
  has_many :ratings, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_many :raters, :through => :ratings, :source => :user

end
