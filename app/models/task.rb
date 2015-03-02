class Task < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :questions, dependent: :destroy
  after_save do
  	@question1 = Question.new
  	@question1.task_id = self.id
  	@question1.question_text = "Free food was reported near you! Do you see some in the area?"
  	@question1.sequence_num = 1
  	@question1.question_options = ["yes", "no"]
  	@question1.save

  	@question2 = Question.new
  	@question2.task_id = self.id
  	@question2.question_text = "Someone confirmed there was free food near you. Is it in Tech or Ford?"
  	@question2.sequence_num = 2
  	@question2.question_options = ["Tech", "Ford"]
  	@question2.save
  end
end
