class Question < ActiveRecord::Base
	belongs_to :task
	has_many :answers
end
