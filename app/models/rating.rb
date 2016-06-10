class Rating < ActiveRecord::Base

  validates :user, :presence => true, :uniqueness => { :scope => :brand }
  validates :brand, :presence => true

  belongs_to :user
  belongs_to :brand

end
