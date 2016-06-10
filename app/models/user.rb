class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => true

  has_many :brands
  has_many :comments
  has_many :ratings, :dependent => :destroy

  has_many :rated_brands, :through => :ratings, :source => :brand

end
