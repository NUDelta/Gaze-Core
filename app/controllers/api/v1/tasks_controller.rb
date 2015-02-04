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
        respond_with @tasks
      end

      private

        def task_params
          params.require(:task).permit(:lat, :lng, :question)
        end
    end
  end
end
