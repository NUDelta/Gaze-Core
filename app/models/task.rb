class Task < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  has_many :events, dependent: :destroy
  has_many :questions, dependent: :destroy
  after_save do
  	@question1 = Question.new
  	@question1.task_id = self.id
  	@question1.question_text = "Is there food here?"
  	@question1.sequence_num = 1
  	@question1.question_options = ["yes", "no", "maybe"]
  	@question1.save

  	@question2 = Question.new
  	@question2.task_id = self.id
  	@question2.question_text = "How much food is left?"
  	@question2.sequence_num = 2
  	@question2.question_options = ["a lot", "some", "almost gone", "none"]
  	@question2.save

  	@question3 = Question.new
  	@question3.task_id = self.id
  	@question3.question_text = "Food or drink?"
  	@question3.sequence_num = 3
  	@question3.question_options = ["food", "drink", "both"]
  	@question3.save
  end
end