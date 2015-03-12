class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  after_save do
    @question_asked = Question.find(self.question_id)
    @task = Task.find(@question_asked.task_id)
    if @question_asked.sequence_num == 1
      @task.confirmed = self.response
      @task.sequence_num = 2
      # branch based on "Tech" or "Ford"
      @floor_question = Question.new
      @floor_question.task_id = @question_asked.task_id
      @floor_question.question_text = "Someone reported free food in Ford! Which floor is it on?"
      @floor_question.sequence_num = 2
      @floor_question.question_options = ["1", "2"]
      @floor_question.save
    end
    if @question_asked.sequence_num == 2
      @task.floor_number = self.response
      @task.sequence_num = 3
      @food_drink = Question.new
      @food_drink.task_id = @question_asked.task_id
      @food_drink.question_text = "There's free food on floor %s of Ford. Is it food or drink?" % [@task.floor_number]
      @food_drink.sequence_num = 3
      @food_drink.question_options = ["food", "drink"]
      @food_drink.save
    end
    if @question_asked.sequence_num == 3
      @task.food_drink = self.response
      @task.sequence_num = 4
      if self.response == "food"
        @food_type = Question.new
        @food_type.task_id = @question_asked.task_id
        @food_type.question_text = "There's free food on floor %s of Ford. What kind is it?" % [@task.floor_number] 
        # TO BE CHANGED AFTER WEDNESDAY
        @food_type.question_options = ["WEDNESDAY"]
        @food_type.sequence_num = 4
        @food_type.save
      else
        @drink_type = Question.new
        @drink_type.task_id = @question_asked.task_id
        @drink_type.question_text = "There's free drinks on floor %s of Ford. What kind is it?" % [@task.floor_number] 
        # TO BE CHANGED AFTER WEDNESDAY
        @drink_type.question_options = ["NONE FOR NOW"]
        @drink_type.sequence_num = 4
        @drink_type.save
      end
    end
    if @question_asked.sequence_num == 4
      @task.sequence_num = 5
      @free_for_everyone = Question.new
      @free_for_everyone.task_id = @question_asked.task_id
      if @task.food_drink = "food"
        @task.food_type = self.response
        @free_for_everyone.question_text = "There's free %s on floor %s of Ford. Are there any restrictions on who can eat it?" % [@task.food_type, @task.floor_number]
      else
        @task.drink_type = self.response
        @free_for_everyone.question_text = "There's free %s on the %s floor of Ford. Are there any restrictions on who can eat it?" % [@task.drink_type, @task.floor_number]
      end
      @free_for_everyone.sequence_num = 5
      @free_for_everyone.question_options = ["yes", "no"]
      @free_for_everyone.save
    end
    if @question_asked.sequence_num == 5
      @task.sequence_num = 6
      # TODO: fix the reversal of logic in our property vs. question. It's confusing right now.
      if self.response == "true"
        @task.free_for_anyone = "no"
      else
        @task.free_for_anyone = "yes"
      end
    end
    @task.save
  end
end
