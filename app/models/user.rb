class User < ActiveRecord::Base
  # this architecture of one user to one device is not likely the best,
  # but will have to do for now
  belongs_to :device
  has_many :events, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates_inclusion_of :food_notifications, :in => [true, false]
  validates_inclusion_of :verify_reports, :in => [true, false]
  validates_inclusion_of :daily_reminders, :in => [true, false]

end
