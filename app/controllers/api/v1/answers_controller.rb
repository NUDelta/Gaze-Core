module Api
  module V1
    class AnswersController < ApplicationController
      respond_to :json
      
      def new
        @answer = Answer.new(answer_params)
        if @answer.save
          respond_with @answer
        else
          respond_with nil
        end
      end
    
      private

        def answer_params
          params.require(:answer).permit(:user_id, :task_id, :event_id, :value)
        end
    end
  end
end