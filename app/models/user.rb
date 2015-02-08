class User < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
end
