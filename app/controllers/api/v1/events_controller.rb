module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json
      
      def new
        @task = Task.near([params[:event][:lat], params[:event][:lng]], 0.04).first
        @user = User.where(:username => params[:username]).first
        @event = Event.new(event_params)
        @event.update_attributes(:user_id => @user.id)
        if @task && @user.answers.where(:task_id => @task.id).empty?
          @event.update_attributes(:task_id => @task.id)
          @event.save
          respond_with @task
        elsif @event.save
          respond_with @event
        else
          respond_with nil
        end
      end
    
      private

        def event_params
          params.require(:event).permit(:lat, :lng)
        end
    end
  end
end