class User < ActiveRecord::Base
  has_many :events

  validates :username, presence: true, uniqueness: true
end
