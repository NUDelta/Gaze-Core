module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json
      
      def new
        # find closest confirmed or unconfirmed task given a users lat lon, with the largest sequence num
        @task = Task.near([params[:event][:lat], params[:event][:lng]], 0.1).where(:confirmed => ["true", nil]).where("sequence_num < ?", 6).order(:sequence_num).last
        # get user given username in parameters
        @user = User.where(:username => params[:username]).first
        if @task
          if @task.user_id != @user.id
            if @user.verify_reports
              @question = @task.questions.where(:sequence_num => @task.sequence_num).first
              respond_with @question
            else
              respond_with nil
            end
          else
            respond_with nil
          end
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
