class Comment < ActiveRecord::Base

  validates :user, :presence => true
  validates :brand, :presence => true
  validates :body, :presence => true

  belongs_to :user
  belongs_to :brand


end
