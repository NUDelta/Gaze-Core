module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json
      
      def index
        @user = User.where(:username => params[:username]).first
        if @user
          @tasks = Task.near([params[:lat], params[:lng]], 1)
  
          respond_with @tasks.reject { |t| !@user.answers.where(:task_id => t.id).empty? }
        else
          error = [{:error => "invalid username"}]
          respond_with error
        end
      end

      private

        def task_params
          params.require(:task).permit(:lat, :lng, :question)
        end
    end
  end
end
