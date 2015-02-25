module Api
  module V1
    class AnswersController < ApplicationController
      respond_to :json

      def index
        if params[:task_id]
          respond_with Task.find(params[:task_id]).answers
        else
          respond_with Task.near([params[:lat], params[:lng]], 1).first.answers
        end
      end
      
      def new
        @answer = Answer.new(answer_params)
        # @answer.question_id = params[:question_id]
        # @answer.task_id = params[:value]
        if @answer.save
          respond_with @answer
        else
          respond_with nil
        end
      end
    
      private

        def answer_params
          params.require(:answer).permit(:question_id, :user_id, :value)
        end
    end
  end
end
