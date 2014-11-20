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
        if @answer.save
          @user = User.find(answer_params[:user_id])
          @user.update_attribute(:score, @user.score + 100);
          respond_with @user
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