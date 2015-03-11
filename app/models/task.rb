class Task < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :questions, dependent: :destroy
  after_create do
    self.sequence_num = 1
  end

  after_save do
  	@question1 = Question.new
  	@question1.task_id = self.id
  	@question1.question_text = "Free food was reported near you! Do you see some in the area?"
  	@question1.sequence_num = 1
  	@question1.question_options = ["yes", "no"]
  	@question1.save
  end
end
