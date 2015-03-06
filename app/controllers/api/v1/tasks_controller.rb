module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json
      
      def index
        @tasks = Task.near([params[:lat], params[:lng]], 10)
        respond_with @tasks
      end

      def new
        @task = Task.new(task_params)
        @task.sequence_num = 1
        if @task.save
          render json: @task
        else
          respond_with nil
        end
      end

      # def show
      #   @tasks = Task.all
      #   render json: @tasks
      # end

      def verified
        @tasks = Task.all
        @verified_tasks = Array.new
        @tasks.each do |t|
          @questions = t.questions
          @questions.each do |q|
            if !(q.answers.empty?)
              @verified_tasks.push Task.find(q.task_id)
            end
          end
        end
        render json: @verified_tasks
      end

      private

        def task_params
          params.require(:task).permit(:lat, :lng, :question, :user_id)
        end
    end
  end
end
