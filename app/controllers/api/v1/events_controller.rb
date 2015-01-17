module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json
      
      def new
        # find closest task given a users lat lon
        @task = Task.near([params[:event][:lat], params[:event][:lng]], 0.1).first
        # get user given username in parameters
        @user = User.where(:username => params[:username]).first
        # if there is a task close enough that the user hasn't answered already
        if @task && @user.answers.where(:task_id => @task.id).empty?
          # create the event
          @event = Event.new(event_params)
          @event.update_attributes(:user_id => @user.id)
          # if the distance is close enough to alert the user
          if @task.distance < 0.04
            # link the task and event together
            @event.update_attributes(:task_id => @task.id)
            @event.save
            respond_with @task
          elsif @event.save
            respond_with @event
          else
            respond_with nil
          end
        else
          error = {:error => "no tasks nearby"}
          respond_with error
        end
      end

      # def new
      #   @task = Task.near([params[:event][:lat], params[:event][:lng]], 0.04).first
      #   @user = User.where(:username => params[:username]).first
      #   @event = Event.new(event_params)
      #   @event.update_attributes(:user_id => @user.id)
      #   if @task && @user.answers.where(:task_id => @task.id).empty?
      #     @event.update_attributes(:task_id => @task.id)
      #     @event.save
      #     respond_with @task
      #   elsif @event.save
      #     respond_with @event
      #   else
      #     respond_with nil
      #   end
      # end
    
      private

        def event_params
          params.require(:event).permit(:lat, :lng)
        end
    end
  end
end