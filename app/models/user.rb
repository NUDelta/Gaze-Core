class User < ActiveRecord::Base
  has_many :events
  has_many :answers

  validates :username, presence: true, uniqueness: true
end
