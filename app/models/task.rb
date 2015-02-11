class Task < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :answers, dependent: :destroy
end
