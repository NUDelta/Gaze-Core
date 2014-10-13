class Event < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  belongs_to :user
  belongs_to :task
end
