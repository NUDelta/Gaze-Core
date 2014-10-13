class Task < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  has_many :events
end
