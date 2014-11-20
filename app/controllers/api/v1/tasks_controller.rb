module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json
      
      def index
        @tasks = Task.near([params[:lat], params[:lng]], 1)
        @user = User.where(:username => params[:username]).first
      
        respond_with @tasks.reject { |t| !@user.answers.where(:task_id => t.id).empty? }
      end

      def new
        @task = Task.new(task_params)
        if @task.save
          respond_with @task
        else
          respond_with nil
        end
      end

      private

        def task_params
          params.require(:task).permit(:lat, :lng, :question)
        end
    end
  end
end