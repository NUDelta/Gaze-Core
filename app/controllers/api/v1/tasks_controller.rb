module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json
      
      def index
        @tasks = Task.near([params[:lat], params[:lng]], 1)
        @user = User.where(:username => params[:username]).first
        
        respond_with @tasks.reject { |t| !@user.events.where(:task_id => t.id).empty? }
      end

    end
  end
end