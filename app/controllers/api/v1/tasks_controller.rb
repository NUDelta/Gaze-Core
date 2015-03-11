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

      def cancel
        @task = Task.find(params[:task_id])
        puts @task
        puts @task.user_id
        puts @task.id
        puts params[:user_id]
        if @task.user_id.to_s == params[:user_id]
          @task.destroy
          render json: @task
        else
          render json: nil
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
          # we need ALL of these fields to be filled up to call it verified
          if t.lat && t.lng && t.sequence_num == 6
            @verified_tasks.push t
          end
        end
        render json: @verified_tasks
      end

      private

        def task_params
          params.require(:task).permit(:lat, :lng, :user_id)
        end
    end
  end
end
