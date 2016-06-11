class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => true

  has_many :brands, :class_name => "Brand", :foreign_key => "user_id"
  has_many :comments, :class_name => "Comment", :foreign_key => "user_id"
  has_many :ratings, :class_name => "Rating", :foreign_key => "user_id"

  has_many :rated_brands, :through => :ratings, :source => :brand

end
