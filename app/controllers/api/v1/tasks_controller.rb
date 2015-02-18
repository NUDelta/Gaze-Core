module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json
      
      def index
        @tasks = Task.near([params[:lat], params[:lng]], 1)
        respond_with @tasks
      end

      def show
        @tasks = Task.all
        render json: @tasks
      end

      def verified
        @tasks = Tasks.all
        @verified_tasks = Array.new
        @tasks.each do |t|
          @questions = t.questions
          @questions.each do |q|
            if !q.answers.empty?
              @verified_tasks.push t
            end
          end
        end
        respond_with @verified_tasks
      end

      private

        def task_params
          params.require(:task).permit(:lat, :lng, :question)
        end
    end
  end
end
