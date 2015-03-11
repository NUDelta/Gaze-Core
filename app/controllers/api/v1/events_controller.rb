module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json
      
      def new
        # find closest confirmed or unconfirmed task given a users lat lon, with the largest sequence num
        @task = Task.near([params[:event][:lat], params[:event][:lng]], 10).where(:confirmed => ["true", nil]).order(:sequence_num).last
        # get user given username in parameters
        @user = User.where(:username => params[:username]).first
        if @task
          #if @task.user_id != @user.id
          @question = @task.questions.where(:sequence_num => @task.sequence_num).first
          respond_with @question
          #else
            #respond_with nil
          #end
        else
          #error = {:error => "no tasks nearby"}
          respond_with nil
        end
      end

      def answer
        @answer = Answer.new()
        @answer.user_id = params[:user_id]
        @answer.question_id = params[:question_id]
        if @answer.save
          render json: @answer
        else
          respond_with nil
        end
        respond_with nil
      end
   
      private

        def event_params
          params.require(:event).permit(:lat, :lng)
        end
    end
  end
end
